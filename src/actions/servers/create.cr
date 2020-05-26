class Servers::Create < BrowserAction
  route do
    if current_user.try &.admin?
      SaveServer.create(params) do |operation, server|
        if server
          flash.success = "The record has been saved"
          redirect Show.with(server.id)
        else
          flash.failure = "It looks like the form is not valid"
          html NewPage, operation: operation
        end
      end
    else
      flash.failure = "Permission denied"
      redirect Index
    end
  end
end
