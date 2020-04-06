class UsersController < ApplicationController

    def index

    end 

    def new 
        @user = User.new
    end 

    def create
        @user = User.create(user_params)
        return redirect_to controller: 'users', action: 'new' unless @user.save
        session[:user_id] = @user.id 
        render :index
    end 

    private 

    def user_params
        params.require(:user).permit(:name, :password, :password_confirmation)
    end 


end
