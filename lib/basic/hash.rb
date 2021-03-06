class Hash
  # https://stackoverflow.com/a/8311281
  def deep_find(key)
    key?(key) ? self[key] : self.values.inject(nil) { |memo, v| memo ||= v.deep_find(key) if v.respond_to?(:deep_find) }
  end
end
