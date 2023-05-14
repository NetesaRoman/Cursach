class MovieShortsController < ApplicationController
  before_action :authenticate_user!
  def index

    @movie_shorts= MovieShort.all
  end
  def show
    @movie_short= MovieShort.find(params[:id])
  end

  def edit
    @movie_short= MovieShort.find(params[:id])
  end

  def update
    @movie_short= MovieShort.find(params[:id])

    @movie_short.update(movie_short_params)

    redirect_to movie_short_path(@movie_short)
  end

  def new
    @movie = Movie.find(params[:movie_id])
    @movie_short = MovieShort.new
  end

  def create
    @movie_short = MovieShort.new(movie_short_params)
    @movie = Movie.find(params[:movie_short][:movie_id])
    @movie_short.movie = @movie

    if @movie_short.save
      # Обработка успешного сохранения
      redirect_to movie_path(@movie)
    else
      # Обработка ошибок при сохранении
      render :new
    end
  end

  def destroy
    @movie_short= MovieShort.find(params[:id])
    @movie_short.destroy

    redirect_to movie_shorts_path, allow_other_host: true
  end

  private
  def movie_short_params
    params.require(:movie_short).permit(:title, :description, :image, :movie_id)
  end
end
