require_relative 'notification'

class Water
  attr_reader :timer

  TIMER = ENV.fetch('TIMER', 15).to_i

  def initialize(timer: TIMER)
    @timer = timer * 60
  end

  def call
    loop do
      execute_actions

      sleep(timer)
    end
  end

  private

  def execute_actions
    return unless working_hours?

    Notification.notify!(message: 'Drink water 💧', topic: 'water')
  end

  def weekday
    Time.now.strftime("%A")
  end

  def hour
    Time.now.hour
  end

  def working_hours?
    hour >= 8 && hour <= 16 && !['Saturday', 'Sunday'].include?(weekday)
  end
end
