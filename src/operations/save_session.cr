class SaveSession < Session::SaveOperation
  permit_columns user_id, sid, access_token
end
