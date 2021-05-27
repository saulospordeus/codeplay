class LessonsController < ApplicationController
    before_action :set_course, only: %i[new create edit update destroy]

    def new
        @lesson = Lesson.new
    end

    def create
        @lesson = @course.lessons.create!(lesson_params)
        redirect_to @course, notice: 'Aula cadastrada com sucesso'
    end

    def show
    @lesson = Lesson.find(params[:id])
    end

    def edit
    @lesson = Lesson.find(params[:id])
    end
    
    def update
        @lesson = Lesson.find(params[:id])
        @lesson.update(lesson_params)
        redirect_to course_lesson_path(@lesson), notice: 'Aula editada com sucesso'
    end

    def destroy
        @lesson = Lesson.find(params[:id])
        @lesson.destroy
        redirect_to @course
    end
   # def edit
   #     @instructor = Instructor.find(params[:id])
   #   end
   #   
   #   def update
   #     @instructor = Instructor.find(params[:id])
   #     @instructor.update(instructor_params)
   #     redirect_to @instructor
   #   end
  

    private

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