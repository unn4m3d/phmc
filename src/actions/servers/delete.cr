class Servers::Delete < BrowserAction
  route do
    if current_user.try &.admin?
      ServerQuery.find(server_id).delete
      flash.success = "Deleted the record"
      redirect Index

    else
      flash.failure = "Permission denied"
      redirect Index
    end
  end
end
