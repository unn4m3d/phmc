class User < BaseModel
  include Carbon::Emailable
  include Authentic::PasswordAuthenticatable

  table do
    column email : String
    column encrypted_password : String
    column username : String
    column role : String
  end

  def emailable : Carbon::Address
    Carbon::Address.new(email)
  end

  def admin?
    self.role.split(":").includes? "admin"
  end
end
