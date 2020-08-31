require "minestat"

class MineStatSerializer < BaseSerializer
  def initialize(@server : Server, @minestat : MineStat::Data)
  end

  def render
    Jbuilder.new do |json|
      json.link "/servers/#{@server.id}"
      json.name @server.name
      json.short_name @server.short_name
      json.version @server.version
      json.ip @server.address
      json.port @server.port

      json.online @minestat.online

      if @minestat.online
        json.motd @minestat.motd
        json.players @minestat.players
        json.max @minestat.max_players
      end
    end.to_h
  end
end
