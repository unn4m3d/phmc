class Api::Yggdrasil::Profile < ApiAction
  include Api::TextureUtils
  include Api::Auth::SkipRequireAuthToken
  get "/api/yggdrasil/profile/" do
    uuid = params.get("uuid")

    session = SessionQuery.new.preload_user.access_token(uuid.delete('-')).first?

    if session
      json({
        id: uuid,
        username: session.user.username,
        properties: [
          {
            name: "textures",
            signature: "Cg==",
            value: encoded_textures(session.user, request.host, uuid)
          }
        ]
      })
    else
      head 204
    end
  end
end
