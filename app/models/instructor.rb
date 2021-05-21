class Instructor < ApplicationRecord
    validates :email, uniqueness: { message: 'Já está em uso'}
    validates :name, :email, presence: { message: 'não pode ficar em branco'}

    has_one_attached :avatar
end
