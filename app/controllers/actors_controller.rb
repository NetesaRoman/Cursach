class ActorsController < ApplicationController
  before_action :authenticate_user!
  def index

    @actors= Actor.all
  end
  def show
    @actor= Actor.find(params[:id])
  end

  def edit
    unless current_user.admin
      redirect_to movies_path, allow_other_host: true
    end

    @actor= Actor.find(params[:id])
  end

  def update


    @actor= Actor.find(params[:id])

    @actor.update(actor_params)

    redirect_to actor_path(@actor)
  end

  def new
    unless current_user.admin
      redirect_to movies_path, allow_other_host: true
    end

    @actor= Actor.new


  end

  def create
    @actor= Actor.create(actor_params)

    redirect_to actors_path, allow_other_host: true
  end

  def destroy
    unless current_user.admin
      redirect_to movies_path, allow_other_host: true
    end

    @actor= Actor.find(params[:id])
    @actor.destroy

    redirect_to actors_path, allow_other_host: true
  end

  private
  def actor_params
    params.require(:actor).permit(:name, :age, :description, :image)
  end
end
