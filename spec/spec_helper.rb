require_relative '../lib/checkout/base'
require_relative '../lib/list/base'

RSpec.configure do |config|
  config.run_all_when_everything_filtered = true
  config.filter_run :focus

  config.order = 'random'
end
