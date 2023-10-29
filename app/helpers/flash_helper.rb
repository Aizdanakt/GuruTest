module FlashHelper

  def display_flash_messages
    flash.map do |type, message|
      content_tag :div, class: "alert alert-#{type} text-white border border-primary", role: 'alert' do
        if message.include?('http')
          concat link_to('Ваша ссылка на Gist', message, target: '_blank')
          puts message.inspect
        else
          concat message
        end
      end
    end.join.html_safe
  end
end
