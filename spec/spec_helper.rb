%w(checkout list chop).each { |f| require_relative "../lib/#{f}/base" }

RSpec.configure do |config|
  config.run_all_when_everything_filtered = true
  config.filter_run :focus

  config.order = 'random'
end
