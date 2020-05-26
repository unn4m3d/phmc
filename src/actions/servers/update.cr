class Servers::Update < BrowserAction
  route do
    if current_user.try &.admin?
      server = ServerQuery.find(server_id)
      SaveServer.update(server, params) do |operation, server|
        if operation.saved?
          flash.success = "The record has been updated"
          redirect Show.with(server.id)
        else
          flash.failure = "It looks like the form is not valid"
          html EditPage, operation: operation, server: server
        end
      end
    else
      flash.failure = "Permission denied"
      redirect Index
    end
  end
end
