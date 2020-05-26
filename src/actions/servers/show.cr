class Servers::Show < BrowserAction
  route do
    html ShowPage, server: ServerQuery.find(server_id)
  end
end
