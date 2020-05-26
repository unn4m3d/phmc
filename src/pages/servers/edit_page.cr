class Servers::EditPage < MainLayout
  needs operation : SaveServer
  needs server : Server
  quick_def page_title, "Edit Server with id: #{@server.id}"

  quick_def page_id, "servers"

  def content
    link "Back to all Servers", Servers::Index
    h1 "Edit Server with id: #{@server.id}"
    render_server_form(@operation)
  end

  def render_server_form(op)
    form_for Servers::Update.with(@server.id) do
      # Edit fields in src/components/servers/form_fields.cr
      mount Servers::FormFields.new(op)

      submit "Update", data_disable_with: "Updating..."
    end
  end
end
