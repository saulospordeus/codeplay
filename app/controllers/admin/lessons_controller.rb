class Admin::LessonsController < ApplicationController
    
    before_action :authenticate_user!, only: %i[show]
    before_action :set_course, only: %i[new create edit update destroy]
    before_action :set_lesson, only: %i[show edit update destroy]
    before_action :user_has_enrollment, only: %i[show]

    def new
        @lesson = Lesson.new
    end

    def create
        @lesson = @course.lessons.create!(lesson_params)
        redirect_to [:admin, @course], notice: 'Aula cadastrada com sucesso'
    end

    def show
    end

    def edit
    end
    
    def update
        @lesson.update(lesson_params)
        redirect_to admin_course_lesson_path(@lesson), notice: 'Aula editada com sucesso'
    end

    def destroy
        @lesson.destroy
        redirect_to admin_course_path(@course)
    end
  

    private

    def user_has_enrollment
        redirect_to @lesson.course unless current_user.courses.include?(@lesson.course)
    end

    def lesson_params
        params.require(:lesson).permit(:name, :duration, :content)
    end

    def set_course
        @course = Course.find(params[:course_id])
    end

    def set_lesson
        @lesson = Lesson.find(params[:id])
      end
    
end