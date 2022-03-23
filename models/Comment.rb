class Comment < ActiveRecord::Base
  belongs_to :target, polymorphic: true
end
