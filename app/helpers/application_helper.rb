module ApplicationHelper


  def errors_for(object, message=nil)
    html = ""
    unless object.errors.blank?
      html << "<div class='formErrors #{object.class.name.humanize.downcase}Errors'>\n"
      if message.blank?
        if object.new_record?
          html << "\t\t<h5>There was a problem creating the #{object.class.name.humanize.downcase}</h5>\n"
        else
          html << "\t\t<h5>There was a problem updating the #{object.class.name.humanize.downcase}</h5>\n"
        end    
      else
        html << "<h5>#{message}</h5>"
      end  
      html << "\t\t<ul>\n"
      object.errors.full_messages.each do |error|
        html << "\t\t\t<li>#{error}</li>\n"
      end
      html << "\t\t</ul>\n"
      html << "\t</div>\n"
    end
    html
  end  
def time_diff_in_natural_language(from_time, to_time)
  from_time = from_time.to_time if from_time.respond_to?(:to_time)
  to_time = to_time.to_time if to_time.respond_to?(:to_time)
  distance_in_seconds = ((to_time - from_time).abs).round
  components = []

  %w(day).each do |interval|
    # For each interval type, if the amount of time remaining is greater than
    # one unit, calculate how many units fit into the remaining time.
    if distance_in_seconds >= 1.send(interval)
      delta = (distance_in_seconds / 1.send(interval)).floor
      distance_in_seconds -= delta.send(interval)
      components << pluralize(delta, interval)
    end
  end
  components.join(", ")
end
end
