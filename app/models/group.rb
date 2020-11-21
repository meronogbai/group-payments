class Group < ApplicationRecord
  belongs_to :user
  has_many :payments_groups
  has_many :payments, through: :payments_groups
  validates :name, presence: true, uniqueness: true, length: { minimum: 3 }
  has_one_attached :icon
end
