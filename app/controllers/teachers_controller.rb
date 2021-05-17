class TeachersController < ApplicationController
    def index
      @teachers = Teacher.all
    end

    def show
      @teacher = Teacher.find(params[:id])
    end

    def new
      @teacher = Teacher.new
    end

    def create
      @teacher = Teacher.new(params.require(:teacher).permit(:name, :email, :bio, :avatar))
      #session[:teacher] = @teacher.id #DEPOIS VERIFICAR ESSA LINHA AQUI PQ NÃO TAVA FUNCIONANDO SEM ELA MAS NÃO ERA PRA PRECISAR DELA
      if @teacher.save
        redirect_to @teacher
      else
        flash[:alert] = 'Você deve informar todos os dados'
        render :new
      end
    end
    
    def edit
      @teacher = Teacher.find(params[:id])
    end
    
    def update
      @teacher = Teacher.find(params[:id])
      @teacher.update(params.require(:teacher).permit(:name, :email, :bio, :avatar))
      redirect_to @teacher
    end

    def destroy
      teacher = Teacher.find(params[:id])
      teacher.destroy
      redirect_to teachers_path
    end


end