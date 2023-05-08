class MoviesController < ApplicationController
  before_action :authenticate_user!
  def index

    @movies= Movie.all
  end
  def show
    @movie= Movie.find(params[:id])
  end

  def edit
    @movie= Movie.find(params[:id])
  end

  def update
    @movie= Movie.find(params[:id])

    @movie.update(movie_params)

    redirect_to movie_path(@movie)
  end

  def new
    @movie= Movie.new
  end

  def create
    @movie= Movie.create(movie_params)

    redirect_to movies_path, allow_other_host: true
  end

  def destroy
    @movie= Movie.find(params[:id])
    @movie.destroy

    redirect_to movies_path, allow_other_host: true
  end

  private
  def movie_params
    params.require(:movie).permit(:title, :description, :poster, :tagline, :year, :country, :world_premier,
                                        :budget, :fees_in_usa, :fees_in_world, :category_id, :url, :draft)
  end
end
