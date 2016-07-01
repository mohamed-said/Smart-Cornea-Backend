class FollowingsController < ActionController::Base

  def create
    if Following.create(following_params)
      render status: :ok
    else
      render status: :unprocessbile_entity
    end
  end

  private

  def following_params
    params.require(:following).permit(:name, :avatar)
  end

end
