class Api::Session::Create < ApiAction

  include Api::Auth::SkipRequireAuthToken

  param login : String = ""
  param password : String = ""
  param client_version : String = ""

  get "/api/session" do
    user = UserQuery.new.username(login).first?

    unless PHMC.launcher_version == client_version
      puts "#{PHMC.launcher_version} != #{client_version}"
      return json({error: "Old client", error_type: "launcher"})
    end

    error : String? = nil
    if user
      if Authentic.correct_password?(user, password)
        return ::Session.create_for user do |op, sdata|
          if sdata
            json({sessionId: sdata.access_token, accessToken: sdata.sid, token: UserToken.generate(user)})
          else
            json({error: "Cannot save session", error_type: "auth"})
          end
        end
      else
        error = "Bad password"
      end
    else
      error = "Bad login"
    end

    json({error: error, error_type: "login"})
  end
end
