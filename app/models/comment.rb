class Comment < ApplicationRecord

  #バリデーション
  validates :content,   presence: true
  validates :prototype, presence: true
  validates :user,      presence: true

  #アソシエーション
  belongs_to :user
  belongs_to :prototype
end
