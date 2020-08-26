class Article < BaseModel
  table do
    column title : String
    column text : String
    column status : String
    belongs_to author : User?
  end
end
