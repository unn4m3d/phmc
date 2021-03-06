class SignUps::NewPage < AuthLayout
  needs operation : SignUpUser

  def content
    h1 "Sign Up"
    render_sign_up_form(@operation)
  end

  private def render_sign_up_form(op)
    form_for SignUps::Create do
      sign_up_fields(op)
      submit "Sign Up", flow_id: "sign-up-button"
    end
    link "Sign in instead", to: SignIns::New
  end

  private def sign_up_fields(op)
    mount Shared::Field.new(op.username, "Username")
    mount Shared::Field.new(op.email, "Email"), &.email_input(autofocus: "true")
    mount Shared::Field.new(op.password, "Password"), &.password_input
    mount Shared::Field.new(op.password_confirmation, "Confirm Password"), &.password_input
  end
end
