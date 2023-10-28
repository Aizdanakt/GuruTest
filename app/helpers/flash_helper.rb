module FlashHelper

  def display_flash_messages
    flash.map do |type, message|
      content_tag :div, class: "alert alert-#{type} text-white border border-primary", role: 'alert' do
        concat message
      end
    end.join.html_safe
  end
end
