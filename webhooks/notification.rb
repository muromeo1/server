require 'net/http'

class Notification
  def self.notify!(url: ENV.fetch('WEBHOOK_URL', ''), message:, topic:)
    uri = URI("#{url}/#{topic}")

    request = Net::HTTP::Post.new(uri)
    request.body = message
    request.content_type = 'application/x-www-form-urlencoded'

    Net::HTTP.start(uri.hostname, uri.port, use_ssl: uri.scheme == 'https') do |http|
      http.request(request)
    end
  end
end
