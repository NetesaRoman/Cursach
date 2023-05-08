class ReviewsController < ApplicationController
  def index

    @reviews= Review.all
  end
  def show
    @review= Review.find(params[:id])
  end

  def edit
    @review= Review.find(params[:id])
  end

  def update
    @review= Review.find(params[:id])

    @review.update(review_params)

    redirect_to review_path(@review)
  end

  def new
    @review= Review.new
  end

  def create
    @review= Review.create(review_params)

    redirect_to "reviews#index", allow_other_host: true
  end

  def destroy
    @review= Review.find(params[:id])
    @review.destroy

    redirect_to "reviews#index", allow_other_host: true
  end

  private
  def review_params
    params.require(:review).permit(:email, :name, :text, parent_id, movie_id)
  end
end
