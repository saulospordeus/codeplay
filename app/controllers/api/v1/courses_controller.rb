class Api::V1::CoursesController < ActionController::API
    def index
        @courses = Course.all
        render json: @courses.as_json(except: [:id, :created_at, :updated_at], include: :instructor)
    end
    
    def show
      @course = Course.find_by(code: params[:code])
      if @course
        render json: @course
      else
        head 404
      end
    end

    def create
    @course = Course.new(course_params)
      if @course.save!
      render json: @course, status: :created
      else
          head 400 
      end
    end

    private
    def course_params
        params
          .require(:course)
          .permit(:name, :description, :code, :price, :instructor_id,
                  :enrollment_deadline, :banner)
      end
    
    
end