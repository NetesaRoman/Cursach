class MoviesController < ApplicationController
  before_action :authenticate_user!
  before_action :find_movie, only: [:like, :dislike]

  def index

    @q = Movie.where(draft: true).ransack(params[:q])
    @movies = @q.result(distinct: true).paginate(page: params[:page], per_page: 8)

    @recent = Movie.where(draft: true).where('created_at >= ?', 1.week.ago).order(created_at: :desc)

  end

  def show
    @movie = Movie.find(params[:id])
    @q = Movie.where(draft: true).ransack(params[:q])
    @movie_shorts = @movie.movie_shorts
    @likes = @movie.likes.count
    @dislikes = @movie.dislikes.count
  end

  def edit
    unless current_user.admin
      redirect_to movies_path, allow_other_host: true
    end

      @movie = Movie.find(params[:id])


  end

  def update



      @category = Category.find(params[:movie][:category_id])
      @movie = Movie.find(params[:id])
      @movie.category = @category
      if  @movie.update(movie_params)
        # Загрузка файла на сервер

        @movie.update(movie_params)

        # запись в смежные таблицы
        genre_ids = params[:movie][:genre_ids] || []
        genre_ids.each do |genre_id|
          @movie.movie_genres.find_or_create_by(genre_id: genre_id)
        end
        actor_ids = params[:movie][:actor_ids] || []
        actor_ids.each do |actor_id|
          @movie.movie_actors.find_or_create_by(actor_id: actor_id)
        end
        director_ids = params[:movie][:director_ids] || []
        director_ids.each do |director_id|
          @movie.movie_directors.find_or_create_by(director_id: director_id)
        end


      else
        if @movie.errors.any?
          @movie.errors.full_messages.each do |message|
            puts message
          end
        end

      end





    redirect_to movie_path(@movie) , allow_other_host: true
  end

  def new

    unless current_user.admin
      redirect_to movies_path, allow_other_host: true
    end

      @movie = Movie.new


  end

  def create


    @category = Category.find(params[:movie][:category_id])
    @movie = Movie.new(movie_params)
    @movie.category = @category
    if @movie.save

      uploaded_file = params[:movie][:poster]
      file_path = Rails.root.join('public', 'posters', uploaded_file.original_filename)
      File.open(file_path, 'wb') do |file|
        file.write(uploaded_file.read)
      end


      @movie.poster = "/posters/#{uploaded_file.original_filename}"


      genre_ids = params[:movie][:genre_ids] || []
      genre_ids.each do |genre_id|
        @movie.movie_genres.find_or_create_by(genre_id: genre_id)
      end
      actor_ids = params[:movie][:actor_ids] || []
      actor_ids.each do |actor_id|
        @movie.movie_actors.find_or_create_by(actor_id: actor_id)
      end
      director_ids = params[:movie][:director_ids] || []
      director_ids.each do |director_id|
        @movie.movie_directors.find_or_create_by(director_id: director_id)
      end

      redirect_to movies_path, allow_other_host: true
    else
      if @movie.errors.any?
        @movie.errors.full_messages.each do |message|
          puts message
        end
      end
      render :new
    end
  end


  def like
    @like = Like.find_or_initialize_by(movie: @movie, user: current_user)
    @dislike = Dislike.find_by(movie: @movie, user: current_user)
    @dislike.destroy if @dislike.present?

    if @like.new_record?
      @like.save
      flash[:success] = "You liked the movie."
    else
      flash[:notice] = "You already liked the movie."
    end

    redirect_to movie_path(@movie)
  end

  def dislike
    @dislike = Dislike.find_or_initialize_by(movie: @movie, user: current_user)
    @like = Like.find_by(movie: @movie, user: current_user)
    @like.destroy if @like.present?

    if @dislike.new_record?
      @dislike.save
      flash[:success] = "You disliked the movie."
    else
      flash[:notice] = "You already disliked the movie."
    end

    redirect_to movie_path(@movie)
  end

  def find_movie
    @movie = Movie.find(params[:id])
  end
  def destroy
    if current_user.admin?
      @movie = Movie.find(params[:id])
      @movie.destroy

      redirect_to movies_path, allow_other_host: true
    end

  end

  private

  def movie_params
    params.require(:movie).permit(:title, :description, :poster, :tagline, :year, :country, :world_premier,
                                  :budget, :fees_in_usa, :fees_in_world, :category_id, :url, actor_ids: [], genre_ids: [], director_ids: [])
  end
end
