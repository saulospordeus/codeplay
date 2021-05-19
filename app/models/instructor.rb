class Instructor < ApplicationRecord
    has_one_attached :avatar
    validates :email, uniqueness: true
  
end