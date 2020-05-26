class Servers::Edit < BrowserAction
  route do
    server = ServerQuery.find(server_id)
    html EditPage,
      operation: SaveServer.new(server),
      server: server
  end
end
