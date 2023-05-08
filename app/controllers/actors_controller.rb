class ActorsController < ApplicationController
  def index

    @actors= Actor.all
  end
  def show
    @actor= Actor.find(params[:id])
  end

  def edit
    @actor= Actor.find(params[:id])
  end

  def update
    @actor= Actor.find(params[:id])

    @actor.update(actor_params)

    redirect_to actor_path(@actor)
  end

  def new
    @actor= Actor.new
  end

  def create
    @actor= Actor.create(actor_params)

    redirect_to "actors#index", allow_other_host: true
  end

  def destroy
    @actor= Actor.find(params[:id])
    @actor.destroy

    redirect_to "actors#index", allow_other_host: true
  end

  private
  def actor_params
    params.require(:actor).permit(:name, :age, :description, :image)
  end
end
