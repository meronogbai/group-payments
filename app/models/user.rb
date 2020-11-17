class User < ApplicationRecord
  has_many :payments, foreign_key: 'author_id'
  has_many :groups
end
