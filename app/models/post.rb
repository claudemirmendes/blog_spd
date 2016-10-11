class Post < ActiveRecord::Base
		establish_connection DB1_CONF
		establish_connection DB2_CONF
  validates :title, presence: true
end
