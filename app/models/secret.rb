class Secret < ActiveRecord::Base
  belongs_to :user
  has_many :likes, dependent: :destroy
  # the below was not needed, but was done to keep consistency
  has_many :users_liked, through: :likes, source: :user
  validates :content, :user_id, :presence => true
end
