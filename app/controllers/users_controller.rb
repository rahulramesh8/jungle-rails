class UsersController < ApplicationController
    def new
    end
    
  def create
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      redirect_to '/'
      flash.now[:success] = "Welcome to the Jungle"
    else
      redirect_to '/signup'
      flash.now[:danger] = 'Invalid Signup - Use unique identifiers!'
    end
  end

  private
    def user_params
        params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end