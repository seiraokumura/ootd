class MicropostController < ApplicationController
  def create
    @micropost = current_user.microposts.build(micropost_params)
    if @micropost.save
      flash[:success] = "投稿しました"
      # redirect_to root_url
    else
      # render 'static_pages/home'
    end
  end

  def destroy
    @micropost.destroy
    flash[:success] = "投稿を削除しました"
  end

  private
  
    def micropost_params
      params.require(:micropost).permit(:name, :content, :image)
    end
  end
end
