class RatingStarsController < ApplicationController
  def index

    @rating_stars= RatingStar.all
  end
  def show
    @rating_star= RatingStar.find(params[:id])
  end

  def edit
    @rating_star= RatingStar.find(params[:id])
  end

  def update
    @rating_star= RatingStar.find(params[:id])

    @rating_star.update(rating_star_params)

    redirect_to rating_star_path(@rating_star)
  end

  def new
    @rating_star= RatingStar.new
  end

  def create
    @rating_star= RatingStar.create(rating_star_params)

    redirect_to "rating_stars#index", allow_other_host: true
  end

  def destroy
    @rating_star= RatingStar.find(params[:id])
    @rating_star.destroy

    redirect_to "rating_stars#index", allow_other_host: true
  end

  private
  def rating_params
    params.require(:rating_star).permit(:value)
  end
end
