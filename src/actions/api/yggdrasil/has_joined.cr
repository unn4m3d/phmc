class Api::Yggdrasil::HasJoined < ApiAction
  include Api::TextureUtils
  include Api::Auth::SkipRequireAuthToken
  get "/api/yggdrasil/has_joined" do
    username = params.get("username")
    server_id = params.get("serverId")

    user = UserQuery.new.username(username).first?

    if user
      session = SessionQuery.new.server_id(server_id).user_id(user.id).first?

      if session
        json({
          id: session.access_token,
          name: user.username,
          properties: [
            {
              name: "textures",
              signature: "Cg==",
              value: encoded_textures(user, request.host, session.access_token)
            }
          ]
        })
      else
        json({error: "Bad login", errorMessage: "Bad session"})
      end
    else
      json({error: "Bad login", errorMessage: "Bad login"})
    end

  end
end
