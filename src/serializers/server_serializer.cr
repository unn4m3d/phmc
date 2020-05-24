class ServerSerializer < BaseSerializer
  def initialize(@server : Server)
  end

  def self.collection_key
    "servers"
  end

  def render
      ({
        short_name: @server.short_name,
        name: @server.name,
        ip: @server.address,
        port: @server.port,
        version: @server.version
      })
  end
end
