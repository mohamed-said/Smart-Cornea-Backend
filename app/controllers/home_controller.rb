class HomeController < ActionController::Base
  def index
    puts "******************"
    puts current_user.inspect
    puts "****************"
  end
end
