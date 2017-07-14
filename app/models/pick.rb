class Pick < ActiveRecord::Base
  belongs_to :user

  validates :name, :user_id, presence: true

  validates :name, uniqueness: {scope: :user_id}
end
