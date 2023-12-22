class FilmsController < ApplicationController
  before_action :find_film, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :edit]

  def index
    if params[:category].blank?
      @films = Film.all.order("created_at DESC")
    else
      @category_id = Category.find_by(name: params[:category]).id
      @films = Film.where(:category_id => @category_id).order("created_at DESC")
    end
  end

  def show
    if @film.reviews.blank?
      @average_review = 0
    else
      @average_review = @film.reviews.average(:rating).round(2)
    end
  end

  def new
    @film = Film.new
    @categories = Category.all.map { |c| [c.name, c.id] }
  end

  def create
    @film = Film.new(film_params)
    @film.category_id = params[:category_id]

    if @film.save
      redirect_to root_path
    else
      render 'new'
    end
  end 

  def edit
    @categories = Category.all.map { |c| [c.name, c.id] }
  end

  def update
    @film.category_id = params[:category_id]
    if @film.update(film_params)
      redirect_to film_path(@film)
    else
      render 'edit'
    end
  end

  def destroy
    @film.destroy
    redirect_to root_path
  end

  private

    def film_params
      params.require(:film).permit(:title, :description, :director, :category_id, :film_img)
    end

    def find_film 
      @film = Film.find(params[:id])
    end
end
