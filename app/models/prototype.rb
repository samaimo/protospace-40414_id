class Prototype < ApplicationRecord

  validates :user, presence: true
  validates :catch_copy, presence: true
  validates :concept, presence: true
  validates :title, presence: true
  validates :image, presence: true

  #アソシエーション
  belongs_to :user
  has_one_attached :image
  has_many :comments, dependent: :destroy

end
