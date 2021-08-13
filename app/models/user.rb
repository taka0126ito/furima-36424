class User < ApplicationRecord
  has_many :purchases
has_many :items
end
