module Commons
  def messages_load(keys)
    data = search_keys(keys, MSG_API || {})
    return data unless data.nil?
  end

  private

  def search_keys(keys, data)
    keys = keys.split(' ') if keys.instance_of? String
    keys.each do |key|
      data = data[key]
      break if data.nil?
    end
    data
  end
end
