class PhotosController < ApplicationController
  def index
  end

  def show
    @photo = Photo.find(params[:id])
  end

  def edit
  end
end
