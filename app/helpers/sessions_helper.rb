module SessionsHelper
  def flash_message(alert)
    if flash[alert]
      content_tag(:p, "#{flash[alert]}", class: 'alert')
    end
  end
end
