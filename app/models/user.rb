class User < ApplicationRecord
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }
  has_many :payments, foreign_key: 'author_id', dependent: :destroy
  has_many :groups, dependent: :destroy
  validates :name, presence: true, uniqueness: true, length: { minimum: 3, maximum: 100 }
  has_one_attached :avatar, dependent: :destroy
  validates :avatar, blob: { content_type: :image }

  # Returns resized image
  def display_image
    avatar.variant(resize_to_limit: [500, 500])
  end
end
