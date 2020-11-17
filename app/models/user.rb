class User < ApplicationRecord
  has_many :payments, foreign_key: 'author_id'
  has_many :groups
  validates :name, presence: true, uniqueness: true, length: { minimum: 3 }
end
