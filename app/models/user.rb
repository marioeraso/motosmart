class User < ApplicationRecord
  has_many :records
  has_many :rankings, through: :records
end
