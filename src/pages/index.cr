require "./main_layout"

class IndexPage < MainLayout
  def content
    render_template "index.slang"
  end

  def page_title
    "Home"
  end

  def page_id
    "home"
  end
end
