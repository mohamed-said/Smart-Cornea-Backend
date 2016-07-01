class Api::V1::SessionsController < Api::V1::BaseController
  skip_before_filter :verify_authenticity_token, :only => [:create, :register, :login]

  def login
    user = User.where(email: params[:email])[0]
    if user
      # sign_in(user)
      render(
        json: user,
        status: 200
      )
    else
      render json: "you shall not pass", status: 404
    end
  end

  def register
    user = User.new(email: params[:email])
    user.password = "asdasd123"

    if user.save
      render json: user, status: 200
    else
      render json: "you shall not pass", status: 404
    end
  end

  private

  def create_params
    params.require(:user).permit(:email, :password)
  end
end
