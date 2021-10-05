class FeedsController < ApplicationController
  before_action :set_feed, only: [:update, :destroy, :edit, :show]
  def new
    if params[:back]
      @feed = Feed.new(feed_params)
    else
      @feed = Feed.new
    end
  end

  def index
    @feeds= Feed.all
  end

  def create
    @feed = Feed.new(feed_params)
    @feed.user_id = current_user.id
    if params[:Retour]
      render :new
     else
       if @feed.save
         flash[:notice] = " Feed posté avec succès" 
         redirect_to feeds_path
       else
         render new_feed_path
       end
     end
  end

  def confirm
    @feed = Feed.new(feed_params)
    @feed.user_id = current_user.id
  end
  
  def edit
  end

  def update
    if @feed.update(feed_params)
      flash[:notice] = " Feed modifié avec succès" 
      redirect_to feed_path
    else
      render :edit 
    end
  end

  def destroy
    flash[:danger] = " Feed supprime" 
    redirect_to feeds_path if @feed.destroy
  end

  private
  def feed_params
    params.require(:feed).permit(:image, :image_cache, :comment)
  end

  def set_feed
    @feed = Feed.find(params[:id])
  end
end
