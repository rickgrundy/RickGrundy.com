# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def camelize(string)
    string.gsub(/\s+/, '_').camelize
  end
end
