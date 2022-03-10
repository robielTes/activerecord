
class Client < ActiveRecord::Base
  has_many :orders;

  def to_s
    "#{id} \t #{firstname} \t #{lastname}"
  end
end
