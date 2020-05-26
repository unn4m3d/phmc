require "mineutils/join_request"

class Api::Yggdrasil::Join < ApiAction
  include Api::Auth::SkipRequireAuthToken
  post "/api/yggdrasil/join" do
    j_req = MineUtils::JoinRequest.from_json request.body.not_nil!

    session = SessionQuery.new.preload_user.sid(j_req.accessToken).access_token(j_req.selectedProfile).first?
    if session.nil?
      json({error: "Bad login", errorMessage: "Bad login"})
    else
      SaveSession.update(session, server_id: j_req.serverId) do |op, s|
        if s
          json({id: j_req.selectedProfile, name: session.user.username})
        else
          json({error: "Internal error", errorMessage: "Cannot save session"})
        end
      end
    end
  end
end
