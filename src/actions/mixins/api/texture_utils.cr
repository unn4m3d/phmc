require "base64"

module Api::TextureUtils
  include Api::FileInfo

  protected def skin_path(username)
    "#{public_root}/skins/#{username}.png"
  end

  protected def skin_url(host, username)
    "https://#{host}/skins/#{username}.png"
  end

  protected def cape_path(username)
    "#{public_root}/capes/#{username}.png"
  end

  protected def cape_url(host, username)
    "https://#{host}/capes/#{username}.png"
  end

  protected def texture_data(user, host, uuid)
    Jbuilder.new do |json|
      json.timestamp Time.local.to_unix
      json.profileId uuid
      json.profileName user.username
      json.isPublic true

      json.textures do |json|
        if File.exists? skin_path(user.username)
          json.SKIN do |json|
            json.url skin_url(host, user.username)
          end
        end

        if File.exists? cape_path(user.username)
          json.CAPE do |json|
            json.url cape_url(host, user.username)
          end
        end
      end
    end.to_json
  end

  protected def encoded_textures(user, host, uuid)
    Base64.strict_encode(texture_data(user, host, uuid))
  end
end
