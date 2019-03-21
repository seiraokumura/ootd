# frozen_string_literal: true

class MicropostsController < ApplicationController
  def new
    @micropost = current_user.microposts.build
  end

  def create
    @micropost = current_user.microposts.build(micropost_params)
    if @micropost.save
      flash[:success] = '投稿しました'
      redirect_to @micropost
    else
      render 'new'
    end
  end

  def destroy
    @micropost.destroy
    flash[:success] = '投稿を削除しました'
  end

  private

  def micropost_params
    params.require(:micropost).permit(:name, :content, :image)
  end
end
