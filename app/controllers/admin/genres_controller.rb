class Admin::GenresController < ApplicationController
  
 def index
    @genres = Genre.all
    @genre = Genre.new
 end

  def create
    @genre = Genre.new(genre_params)
    if @genre.save
      redirect_to admin_genres_path
    else
      flash[:genre_created_error] = "ジャンル名を入力してください"
      redirect_to
    end
  end

  def edit
    @genre = Genre.find(params[:id])
  end

  def update
    @genre = Genre.find(params[:id])
    if @genre.update(genre_params)
      redirect_to admin_genres_path
      flash[:success] = "編集に成功しました"
    else
      flash[:danger] = "編集に失敗しました"
      render :edit
    end
  end

  private

  def genre_params
    params.require(:genre).permit(:name)
  end
end
