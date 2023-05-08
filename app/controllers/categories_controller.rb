class CategoriesController < ApplicationController
  def index

    @categories= Category.all
  end
  def show
    @category= Category.find(params[:id])
  end

  def edit
    @category= Category.find(params[:id])
  end

  def update
    @category= Category.find(params[:id])

    @category.update(category_params)

    redirect_to category_path(@category)
  end

  def new
    @category= Category.new
  end

  def create
    @category= Category.create(category_params)

    redirect_to "categories#index", allow_other_host: true
  end

  def destroy
    @category= Category.find(params[:id])
    @category.destroy

    redirect_to "categories#index", allow_other_host: true
  end

  private
  def category_params
    params.require(:category).permit(:name, :description, :url)
  end
end
