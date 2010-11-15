module ApplicationHelper
  def spinner(extra = nil)
    e = extra ? "spinner_#{extra}" : 'spinner'
    image_tag('loading.gif', :id => e, :style => 'display:none', :class => 'spinner')
  end
end
