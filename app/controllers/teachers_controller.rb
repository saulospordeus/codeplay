class TeachersController < ApplicationController
    def index
    @teachers = Teacher.all
    end

    def new
        @teacher = Teacher.new
    end

    def create
        @teacher = Teacher.create!(params.require(:teacher).permit(:name, :email, :bio, :avatar))
        redirect_to teachers_path
    end

end
