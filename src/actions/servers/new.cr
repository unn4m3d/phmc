class Servers::New < BrowserAction
  route do
    html NewPage, operation: SaveServer.new
  end
end
