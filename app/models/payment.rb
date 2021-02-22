class Payment < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :payments_groups, dependent: :destroy
  has_many :groups, through: :payments_groups
  validates :name, presence: true, uniqueness: true, length: { minimum: 3, maximum: 100 }
  validates :amount, presence: true, numericality: { less_than: 10_000 }
end
