class Shared::FlashMessages < BaseComponent
  needs flash : Lucky::FlashStore

  def render
    flash.each do |flash_type, flash_message|
      div class: "alert #{flash_class(flash_type)}", flow_id: "flash" do
        text flash_message
      end
    end
  end

  def flash_class(flash_type)
    case flash_type
    when "failure"
      "alert-danger"
    else
      "alert-#{flash_type}"
    end
  end
end
