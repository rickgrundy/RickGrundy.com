class String
  def urlify
    self.gsub(/\s+/, '_').camelize
  end
end