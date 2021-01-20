class Group < ApplicationRecord
  belongs_to :user
  has_many :payments_groups
  has_many :payments, through: :payments_groups
  validates :name, presence: true, uniqueness: true, length: { minimum: 3, maximum: 100 }
  has_one_attached :icon
  validates :icon, blob: { content_type: :image }

  # Returns resized image
  def display_image
    icon.variant(resize_to_limit: [500, 500])
  end
end
