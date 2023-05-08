class RatingController < ApplicationController
  def index

    @ratings= Rating.all
  end
  def show
    @rating= Rating.find(params[:id])
  end

  def edit
    @rating= Rating.find(params[:id])
  end

  def update
    @rating= Rating.find(params[:id])

    @rating.update(rating_params)

    redirect_to rating_path(@rating)
  end

  def new
    @rating= Rating.new
  end

  def create
    @rating= Rating.create(rating_params)

    redirect_to "rating#index", allow_other_host: true
  end

  def destroy
    @rating= Rating.find(params[:id])
    @rating.destroy

    redirect_to "rating#index", allow_other_host: true
  end

  private
  def rating_params
    params.require(:rating).permit(:ip, :star_id, :movie_id)
  end
end
