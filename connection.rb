require 'active_record'

ActiveRecord::Base.establish_connection(YAML.load_file('db/config.yml')['development'])

# Setup logger (so that we may inspect the generated SQL)
require 'logger'
ActiveSupport::LogSubscriber.colorize_logging = false
ActiveRecord::Base.logger = Logger.new("ar.log")
