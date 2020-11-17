class Group < ApplicationRecord
  belongs_to :user
  has_many :payments_groups
  has_many :payments, through: :payments_groups
end
