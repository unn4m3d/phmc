class Servers::ShowPage < MainLayout
  needs server : Server
  quick_def page_title, "Server with id: #{@server.id}"

  quick_def page_id, "servers"

  def content
    link "Back to all Servers", Servers::Index
    h1 "Server with id: #{@server.id}"
    render_actions
    render_server_fields
  end

  def render_actions
    section do
      link "Edit", Servers::Edit.with(@server.id)
      text " | "
      link "Delete",
        Servers::Delete.with(@server.id),
        data_confirm: "Are you sure?"
    end
  end

  def render_server_fields
    ul do
      li do
        text "name: "
        strong @server.name.to_s
      end
      li do
        text "short_name: "
        strong @server.short_name.to_s
      end
      li do
        text "version: "
        strong @server.version.to_s
      end
      li do
        text "address: "
        strong @server.address.to_s
      end
      li do
        text "port: "
        strong @server.port.to_s
      end
    end
  end
end
