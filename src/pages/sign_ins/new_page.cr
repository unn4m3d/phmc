class SignIns::NewPage < MainLayout
  needs operation : SignInUser

  def content
    op = @operation
    render_template "sign_ins/new_page.slang"
  end

end
