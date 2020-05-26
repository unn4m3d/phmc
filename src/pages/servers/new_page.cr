class Servers::NewPage < MainLayout
  needs operation : SaveServer
  quick_def page_title, "New Server"

  quick_def page_id, "servers"

  def content
    h1 "New Server"
    render_server_form(@operation)
  end

  def render_server_form(op)
    form_for Servers::Create do
      # Edit fields in src/components/servers/form_fields.cr
      mount Servers::FormFields.new(op)

      submit "Save", data_disable_with: "Saving..."
    end
  end
end
