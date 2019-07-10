uri = URI.parse ENV['REDIS_URI']

Redis.current = Redis.new uri: uri
