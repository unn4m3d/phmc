class Servers::IndexPage < MainLayout
  needs servers : ServerQuery
  quick_def page_title, "All Servers"

  quick_def page_id, "servers"

  def content
    h1 "All Servers"
    if current_user.try &.admin?
      link "New Server", to: Servers::New
    end
    render_servers
  end

  def render_servers
    #ul do
    #  @servers.each do |server|
    #    li do
    #      link server.name, Servers::Show.with(server)
    #    end
    #  end
    #end

    render_template "servers/index.slang"
  end
end
