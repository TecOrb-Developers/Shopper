module ApplicationHelper
  
  def number_to_currency(number, options = {})
    options[:unit] ||= Shoppe.config[:currency_unit]
    super
  end
  
  def time_until_next_delivery_cutoff
    '4 hours'
  end
  
  def active_nav_item(item)
    @active_nav_item = item
  end
  
  def link_to(name, options = nil, html_options = nil, &block)
    if html_options && @active_nav_item && @active_nav_item == html_options[:nav_item] 
      html_options[:class] = 'active'
    end
    super
  end
  
  def markdown(text)
    return '' if text.blank?
    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, :autolink => true, :space_after_headers => true)
    markdown.render(text).html_safe
  end
  
end