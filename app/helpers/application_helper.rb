module ApplicationHelper
  
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
  
  def next_delivery_cutoff
    fourpm = Time.now.change(:hour => 16, :minute => 0)
    fourpm = (fourpm + 1.day).change(:hour => 16, :minute => 0) if fourpm < Time.now
    fourpm = (fourpm + 1.day).change(:hour => 16, :minute => 0) if fourpm.sunday?
    fourpm = (fourpm + 2.day).change(:hour => 16, :minute => 0) if fourpm.saturday?
    fourpm
  end
  
  def time_until_next_delivery_cut_off
    minutes = (next_delivery_cutoff - Time.now) / 60
    whole_hours = (minutes / 60).floor
    remaining_minutes = (minutes - (whole_hours * 60)).to_i
    Array.new.tap do |a|
      a << pluralize(whole_hours, 'hour') if whole_hours > 0
      a << pluralize(remaining_minutes, 'minute') if remaining_minutes > 0
    end.to_sentence
  end
  
  def next_delivery_day
    date = next_delivery_cutoff.to_date + 1.day
    case date
    when Date.tomorrow
      "tomorrow"
    else
      "on " + date.strftime("%A")
    end
  end
  
end