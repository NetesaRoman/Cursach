class ReviewsController < ApplicationController
  before_action :authenticate_user!
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
    @review = Review.new(review_params)
    @movie = Movie.find(review_params[:movie_id])
    if @review.save
      flash[:success] = "Review created successfully."
    else
      flash[:error] = "Error creating review."
    end

    redirect_to movie_path(@movie)
  end

  def destroy
    @review= Review.find(params[:id])
    @review.destroy


    redirect_to reviews_path, allow_other_host: true
  end

  private
  def review_params
    params.require(:review).permit(:email, :name, :text, :parent_id, :movie_id)
  end
end
