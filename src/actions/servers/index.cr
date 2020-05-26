class Servers::Index < BrowserAction
  route do
    html IndexPage, servers: ServerQuery.new
  end
end
