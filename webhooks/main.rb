require_relative 'water'
require_relative 'internet_checker'

app_name = ENV.fetch('APP', '').split('_').collect(&:capitalize).join

app = Object.const_get(app_name)
app.new.call
