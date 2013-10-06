class UsersController < ApplicationController
  
  # creates a new user, handles signup failure
  def create
    @user = User.new(user_params)
    if @user.save
	    create_cookies(params[:username], params[:password])
      flash[:success] = "Thank you for your registration at Usyd Connect. You will be redirected shortly."
      redirect_to @user
    else
      render 'new'
    end
  end
  
  # Action for displaying a user's profile
  def show
    @user = User.find(params[:id])
  end


  def new
    @user = User.new
  end

  private

    def user_params
      params.require(:user).permit(:username, :email, :password, :password_confirmation)
    end

end
