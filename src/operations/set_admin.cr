class SetAdmin < User::SaveOperation
  permit_columns role
end
