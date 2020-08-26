abstract class MainLayout
  include Lucky::HTMLPage
  include Translator

  abstract def content
  abstract def page_title

  needs current_user : User?

  # MainLayout defines a default 'page_title'.
  #
  # Add a 'page_title' method to your indivual pages to customize each page's
  # title.
  #
  # Or, if you want to require every page to set a title, change the
  # 'page_title' method in this layout to:
  #
  #    abstract def page_title : String
  #
  # This will force pages to define their own 'page_title' method.
  def page_title
    "Welcome"
  end

  def page_id : String
    "unknown"
  end

  def nav_item_class(other_page_id)
    if page_id != other_page_id.to_s
      "nav-item"
    else
      "nav-item active"
    end
  end

  def render
    #html_doctype

    #html lang: "en" do
    #  mount Shared::LayoutHead.new(page_title: page_title, context: context)

    #  body do
    #    mount Shared::FlashMessages.new(context.flash)
    #    content
    #  end
    #end

    render_template "main_layout.slang"
  end
end
