require "mineutils"

class Session < BaseModel
  table do
    column sid : String
    column access_token : String
    belongs_to user : User
    column server_id : String
  end

  def self.create_for(user : User)
    access_token = MineUtils::UUID.generate(user.username)
    session_id = Digest::MD5.hexdigest("#{user.username}#{Time.utc.to_s}")
    SaveSession.create(
      user_id: user.id,
      access_token: access_token.delete('-'),
      sid: session_id,
      server_id: "nonexistent"
    ) do |op, data|
      yield op, data
    end
  end
end
