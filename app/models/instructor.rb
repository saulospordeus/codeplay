class Instructor < ApplicationRecord
    has_many :courses
    
    validates :email, uniqueness: true
    validates :name, :email, presence: true
    has_one_attached :avatar
   
    def display_name
        "#{name} - #{email}"
    end
end
