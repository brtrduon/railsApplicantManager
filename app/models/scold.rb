class Scold < ActiveRecord::Base
  belongs_to :user
  belongs_to :recycle
end
