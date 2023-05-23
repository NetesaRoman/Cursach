class DirectorsController < ApplicationController
  before_action :authenticate_user!
  def index

    @directors= Director.all
  end
  def show
    @director= Director.find(params[:id])
  end

  def edit
    unless current_user.admin
      redirect_to movies_path, allow_other_host: true
    end

    @director= Director.find(params[:id])
  end

  def update


    @director= Director.find(params[:id])

    @director.update(director_params)

    redirect_to director_path(@director)
  end

  def new
    unless current_user.admin
      redirect_to movies_path, allow_other_host: true
    end

    @director= Director.new


  end

  def create
    @director= Director.create(director_params)

    if @director.save
      # Загрузка файла на сервер
      uploaded_file = params[:director][:image]
      file_path = Rails.root.join('public', 'directors', uploaded_file.original_filename)
      File.open(file_path, 'wb') do |file|
        file.write(uploaded_file.read)
      end

      # Сохранение пути к файлу в базе данных
      @director.image = "/directors/#{uploaded_file.original_filename}"
      @director.save


      redirect_to directors_path, allow_other_host: true
    else
      render :new
    end
  end

  def destroy
    unless current_user.admin
      redirect_to movies_path, allow_other_host: true
    end

    @director= Director.find(params[:id])
    @director.destroy

    redirect_to directors_path, allow_other_host: true
  end

  private
  def director_params
    params.require(:director).permit(:name, :date_of_birth, :description, :image)
  end
end
