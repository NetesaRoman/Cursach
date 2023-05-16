class CategoriesController < ApplicationController
  before_action :authenticate_user!
  def index

    @categories= Category.all
  end
  def show
    @category= Category.find(params[:id])
  end

  def edit
    unless current_user.admin
      redirect_to movies_path, allow_other_host: true
    end

    @category= Category.find(params[:id])
  end

  def update
    @category= Category.find(params[:id])

    @category.update(category_params)

    redirect_to category_path(@category)
  end

  def new
    unless current_user.admin
      redirect_to movies_path, allow_other_host: true
    end

    @category= Category.new
  end

  def create
    @category= Category.create(category_params)

    redirect_to categories_path, allow_other_host: true
  end

  def destroy
    unless current_user.admin
      redirect_to movies_path, allow_other_host: true
    end

    @category= Category.find(params[:id])
    @category.destroy

    redirect_to categories_path, allow_other_host: true
  end

  private
  def category_params
    params.require(:category).permit(:name, :description, :url)
  end
end
