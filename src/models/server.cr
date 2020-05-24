class Server < BaseModel
  table do
    column name : String
    column short_name : String
    column version : String
    column address : String
    column port : Int16
  end
end
