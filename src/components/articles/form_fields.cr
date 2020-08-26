class Articles::FormFields < BaseComponent
  needs operation : SaveArticle

  def render
    mount Shared::Field.new(operation.title), &.text_input(autofocus: "true")
    mount Shared::Field.new(operation.text)
    mount Shared::Field.new(operation.status)
  end
end
