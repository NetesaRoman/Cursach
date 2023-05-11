class MoviesController < ApplicationController
  before_action :authenticate_user!

  def index

    @movies = Movie.all
  end

  def show
    @movie = Movie.find(params[:id])
  end

  def edit
    @movie = Movie.find(params[:id])
  end

  def update
    @movie = Movie.find(params[:id])

    @movie.update(movie_params)

    redirect_to movie_path(@movie)
  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.new(movie_params)
    if @movie.save
      # Загрузка файла на сервер
      uploaded_file = params[:movie][:poster]
      file_path = Rails.root.join('public', 'posters', uploaded_file.original_filename)
      File.open(file_path, 'wb') do |file|
        file.write(uploaded_file.read)

      end

      # Сохранение пути к файлу в базе данных
      @movie.poster = "/posters/#{uploaded_file.original_filename}"
      @movie.save

      # запись в смежные таблицы
      genre_ids = params[:movie][:genre_ids] || []
      genre_ids.each do |genre_id|
        @movie.movie_genres.create(genre_id: genre_id)
      end
      actor_ids = params[:movie][:actor_ids] || []
      actor_ids.each do |actor_id|
        @movie.movie_actors.create(actor_id: actor_id)
      end

      director_ids = params[:movie][:director_ids] || []
      director_ids.each do |director_id|
        @movie.movie_directors.create(director_id: director_id)
      end
    end
    redirect_to movies_path, allow_other_host: true

  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy

    redirect_to movies_path, allow_other_host: true
  end

  private

  def movie_params
    params.require(:movie).permit(:title, :description, :poster, :tagline, :year, :country, :world_premier,
                                  :budget, :fees_in_usa, :fees_in_world, :category_id, :url, :draft)
  end
end
