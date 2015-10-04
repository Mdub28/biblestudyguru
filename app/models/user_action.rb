class UserAction < ActiveRecord::Base
  belongs_to :user

  def self.recent
    order('created_at desc').limit(10)
  end
end
