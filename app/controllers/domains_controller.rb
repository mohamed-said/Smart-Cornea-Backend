class DomainsController < ActionController::Base

  def create
    @domain = Domain.new(domain_params)
    @domain.user_id = params["user_id"]

    if @domain.save
      # redirect_to :controller => 'domains', :action => 'show'
      render json: @domain
    else
      render status: :unprocessbile_entity
    end
  end

  def show
    user = User.find(params["user_id"])
    @domains = user.domains
    render json: @domains
  end

  def state_file
    @domain = Domain.find(params["id"])
    render text: @domain.recognizer_state
  end

  def store_state_file
    @domain = Domain.find(params["id"])
    @domain.recognizer_state = params["recognizer_state"]
    if @domain.save
      render json: @domain
    else
      render json: "No sign of hope", status: :unprocessbile_entity
    end
  end

  def view_create
  end

  private

  def domain_params
    params.require(:domain).permit(:name)
  end
end
