class MovieShortsController < ApplicationController
  before_action :authenticate_user!
  def index

    @movie_shorts= MovieShort.all
  end
  def show
    @movie_short= MovieShort.find(params[:id])
  end

  def edit
    unless current_user.admin
      redirect_to movies_path, allow_other_host: true
    end

    @movie_short= MovieShort.find(params[:id])
  end

  def update
    @movie_short= MovieShort.find(params[:id])

    @movie_short.update(movie_short_params)

    redirect_to movie_short_path(@movie_short)
  end

  def new
    unless current_user.admin
      redirect_to movies_path, allow_other_host: true
    end

    @movie = Movie.find(params[:movie_id])
    @movie_short = MovieShort.new
  end

  def create
    @movie_short = MovieShort.new(movie_short_params)
    @movie = Movie.find(params[:movie_short][:movie_id])
    @movie_short.movie = @movie



    if @movie_short.save
      # Загрузка файла на сервер
      uploaded_file = params[:movie_short][:image]
      file_path = Rails.root.join('public', 'shorts', uploaded_file.original_filename)
      File.open(file_path, 'wb') do |file|
        file.write(uploaded_file.read)
      end

      # Сохранение пути к файлу в базе данных
      @movie_short.image = "/shorts/#{uploaded_file.original_filename}"
      @movie_short.save


      redirect_to movie_path(@movie), allow_other_host: true
    else
      render :new
    end
  end

  def destroy
    unless current_user.admin
      redirect_to movies_path, allow_other_host: true
    end

    @movie_short= MovieShort.find(params[:id])
    @movie_short.destroy

    redirect_to movie_shorts_path, allow_other_host: true
  end

  private
  def movie_short_params
    params.require(:movie_short).permit(:title, :description, :image, :movie_id)
  end
end
