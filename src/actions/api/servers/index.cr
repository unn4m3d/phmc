class Api::Servers::Index < ApiAction
  include Api::Auth::SkipRequireAuthToken

  route do
    json ServerSerializer.for_collection ServerQuery.new
  end
end
