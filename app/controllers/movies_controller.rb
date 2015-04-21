class MoviesController < ApplicationController
  before_action :set_movie, only: [:show, :edit, :update, :destroy, :upvote, :downvote]
  before_filter :authenticate_user_from_token!, except: [:index]
  before_filter :authenticate_user!, except: [:index]


  def index
    @movies = Movie.all.order(:cached_weighted_score => :desc)

    respond_to do |format|
     format.html
     format.json {render json: @movies }
    end

  end

  def show
  end

  def new
    @movie = Movie.new
  end


  def edit
  end

  def create
    @user = current_user
    @movie = @user.movies.create(movie_params)
    @movie.my_url = @movie.avatar.url
    @movie.save

    respond_to do |format|
      if @movie.save
        
        format.html { redirect_to @movie, notice: 'Movie was successfully indeed created.' }
        format.json { render :show, status: :created, location: @movie }
      else
        format.html { render :new }
        format.json { render json: @movie.errors, status: :unprocessable_entity }
      end
    end
  end

  def create_from_app
    @user = current_user
    @movie = @user.movies.new(movie_params_from_app)

    if @movie.save
      respond_to do |format|
        format.json { render json: @movie }
      end
    else
      respond_to do |format|
        format.json { render json: @movie.errors }
      end
    end
  end

  def update
    respond_to do |format|
      if @movie.update(movie_params)
        format.html { redirect_to @movie, notice: 'Movie was successfully updated.' }
        format.json { render :show, status: :ok, location: @movie }
      else
        format.html { render :edit }
        format.json { render json: @movie.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @movie.destroy
    respond_to do |format|
      format.html { redirect_to movies_url, notice: 'Movie was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def destroy_from_app
    @movie.destroy
    respond_to do |format|
      format.html { redirect_to movies_url, notice: 'Movie was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def upvote
    @movie.upvote_from current_user
    redirect_to movies_path
  end

  def downvote
    @movie.downvote_from current_user
    redirect_to movies_path
  end
  

  private

    def set_movie
      @movie = Movie.find(params[:id])
    end

    def movie_params
      params.require(:movie).permit(:title, :avatar, :my_url, :price)
    end

    def movie_params_from_app
      params.require(:movie).permit(:title, :my_url)
    end

end
