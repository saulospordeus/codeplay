class InstructorsController < ApplicationController
    def index
      @instructors = Instructor.all
    end

    def show
      @instructor = Instructor.find(params[:id])
    end

    def new
      @instructor = Instructor.new
    end

    def create
      @instructor = Instructor.new(params.require(:instructor).permit(:name, :email, :bio, :avatar))
      #session[:instructor] = @instructor.id #DEPOIS VERIFICAR ESSA LINHA AQUI PQ NÃO TAVA FUNCIONANDO SEM ELA MAS NÃO ERA PRA PRECISAR DELA
      if @instructor.save
        redirect_to @instructor
      else
        flash[:alert] = 'Você deve informar todos os dados'
        render :new
      end
    end
    
    def edit
      @instructor = Instructor.find(params[:id])
    end
    
    def update
      @instructor = Instructor.find(params[:id])
      @instructor.update(params.require(:instructor).permit(:name, :email, :bio, :avatar))
      redirect_to @instructor
    end

    def destroy
      instructor = Instructor.find(params[:id])
      instructor.destroy
      redirect_to instructors_path
    end


end