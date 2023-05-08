class GenresController < ApplicationController
  before_action :authenticate_user!
  def index

    @genres= Genre.all
  end
  def show
    @genre= Genre.find(params[:id])
  end

  def edit
    @genre= Genre.find(params[:id])
  end

  def update
    @genre= Genre.find(params[:id])

    @genre.update(genre_params)

    redirect_to genre_path(@genre)
  end

  def new
    @genre= Genre.new
  end

  def create
    @genre= Genre.create(genre_params)

    redirect_to genres_path, allow_other_host: true
  end

  def destroy
    @genre= Genre.find(params[:id])
    @genre.destroy

    redirect_to genres_path, allow_other_host: true
  end

  private
  def genre_params
    params.require(:genre).permit(:name, :description, :url)
  end
end
