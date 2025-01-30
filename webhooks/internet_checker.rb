require_relative 'notification'

class InternetChecker
  attr_reader :ping_time, :offline, :sent

  PING_TIME = ENV.fetch('PING_TIME', 5).to_i

  def initialize(ping_time: PING_TIME)
    @ping_time = ping_time

    @offline = false
    @sent = false
  end

  def call 
    loop do
      ping
      notify!

      sleep(ping_time)
    end
  end

  private

  def ping
    Net::HTTP.get_response(URI.parse('http://www.google.com'))

    @offline = false 
  rescue StandardError
    puts "INFO -- Internet is down at #{Time.now}" 

    @offline = true
    @sent = false
  end

  def notify!
    return unless should_send?

    Notification.notify!(message: 'Internet is back ⚡️', topic: 'internet')

    @sent = true
  end

  def should_send?
    !offline && !sent
  end
end
