class User < ActiveRecord::Base
  has_many :picks

  validates :username, :password_hash, presence:true
end
