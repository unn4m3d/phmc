require "minestat"

class Api::Servers::Show < ApiAction
  include Api::Auth::SkipRequireAuthToken
  param short_name : String = ""

  get  "/api/server" do
    server = ServerQuery.new.short_name(short_name).first?

    if server.nil?
      json({error: "No such server #{short_name}", error_type: "server"})
    else
      md = MineStat::Data.new(server.address, server.port.to_u32)
      json MineStatSerializer.new server, md
    end
  end
end
