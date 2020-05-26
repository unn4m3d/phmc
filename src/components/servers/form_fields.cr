class Servers::FormFields < BaseComponent
  needs operation : SaveServer

  def render
    mount Shared::Field.new(operation.name), &.text_input(autofocus: "true")
    mount Shared::Field.new(operation.short_name)
    mount Shared::Field.new(operation.version)
    mount Shared::Field.new(operation.address)
    mount Shared::Field.new(operation.port)
  end
end
