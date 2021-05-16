class TeachersController < ApplicationController
    def index
    @teachers = Teacher.all
    end

    #def show
    #@course = Course.find(params[:id])
    #end

end