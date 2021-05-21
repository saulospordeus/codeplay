class InstructorsController < ApplicationController
  before_action :set_instructor, only: %i[update edit show destroy]
    
    def index
      @instructors = Instructor.all
    end

    def show
    end

    def new
      @instructor = Instructor.new
    end

    def create
      @instructor = Instructor.new(instructor_params)
      if @instructor.save
        redirect_to @instructor
      else
        flash[:alert] = 'Você deve informar todos os dados'
        render :new
      end
    end
    
    def edit
    end
    
    def update
      @instructor.update(instructor_params)
      redirect_to @instructor
    end

    def destroy
      @instructor.destroy
      redirect_to instructors_path
    end
    
    private 

    def set_instructor
      @instructor = Instructor.find(params[:id])
    end
    
    def instructor_params
      params.require(:instructor).permit(:name, :email, :bio, :avatar)
    end

end