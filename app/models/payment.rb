class Payment < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :payments_groups
  has_many :groups, through: :payments_groups
  validates :name, presence: true, uniqueness: true, length: { minimum: 3 }
  validates :amount, presence: true, numericality: true
end
