require "./shards"

macro render_template(tpl)
  Kilt.embed("src/pages/{{tpl.id}}", io_name: view)
end

# Load the asset manifest in public/mix-manifest.json
Lucky::AssetHelpers.load_manifest
require "./translator"

require "./app_database"
require "./models/base_model"
require "./models/mixins/**"
require "./models/**"
require "./queries/mixins/**"
require "./queries/**"
require "./operations/mixins/**"
require "./operations/**"
require "./serializers/base_serializer"
require "./serializers/**"
require "./emails/base_email"
require "./emails/**"
require "./actions/mixins/**"
require "./actions/**"
require "./components/base_component"
require "./components/**"
require "./pages/**"
require "../config/env"
require "../config/**"
require "../db/migrations/**"
require "./app_server"
