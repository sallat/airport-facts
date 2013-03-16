module ApplicationHelper
  
  def string_with_link(str, link_url, link_options = {})
  match = str.match(/__([^_]{2,30})__/)
  if !match.blank?
    raw($` + link_to($1, link_url, link_options) + $')
  else
    raise "string_with_link: No place for __link__ given in #{str}" if Rails.env.test?
    nil
  end
  end
end
