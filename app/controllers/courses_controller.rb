class CoursesController < ApplicationController
  before_action :set_course, only: %i[update edit show]


    def index
      @courses = Course.all
    end

    def show
    end

    def new
     @course = Course.new
    end

    def create
    @course = Course.new(course_params)
    @course.save
    redirect_to @course
    end

    def edit
    end

    def update
    @course.update(course_params)
    redirect_to @course
    end


    private 

    def set_course
      @course = Course.find(params[:id])
    end
    
    def course_params
        params
        .require(:course)
        .permit(:name, :description, :code, :price, :enrollment_deadline)
    end


end