require_relative 'connection'
require_relative 'models'

ActiveRecord::Base.connection.execute("SELECT 1")
