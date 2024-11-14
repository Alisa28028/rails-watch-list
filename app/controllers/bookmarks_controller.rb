class BookmarksController < ApplicationController
  def new
    @bookmark = Bookmark.new
    @list = List.find(params[:list_id])
    @movies = Movie.all
  end

  def create
    @bookmark = Bookmark.new(list_params)
    if @bookmark.save
      redirect_to list_path(@list)
    else
      render'new', status: :unprocessable_entity
    end
  end

  def bookmark_params
    params.require(:bookmark).permit(:name)
  end
end
