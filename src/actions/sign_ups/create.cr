class SignUps::Create < BrowserAction
  include Auth::RedirectSignedInUsers

  post "/sign_up" do
    SignUpUser.create(params, role: "noone") do |operation, user|
      if user
        flash.info = "Thanks for signing up"
        if user.id == 1
          SetAdmin.update!(user, role: "admin")
        end
        sign_in(user)
        redirect to: Home::Index
      else
        flash.info = "Couldn't sign you up"
        html NewPage, operation: operation
      end
    end
  end
end
