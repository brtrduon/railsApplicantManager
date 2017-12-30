class SessionsController < ApplicationController
    skip_before_action :require_login, only: [:new, :login]
    
    def index
        if session[:user_id]
            redirect_to '/home'
        end
    end

    def register
        @user = User.new user_params
        if @user.save
            session[:user_id] = @user.id
            redirect_to "/home"
        else
            flash[:errors] = @user.errors.full_messages
            redirect_to "/"
        end
    end

    def login
        @user = User.find_by_email(params[:email])
        if @user && @user.authenticate(params[:password])
          session[:user_id] = @user.id
          redirect_to "/home"
        else 
          flash[:errors] = ['Invalid email/password combination']
          redirect_to "/"
        end
    end

    def destroy
        reset_session
        flash[:errors] = ["Your session has expired"]
        redirect_to "/"
    end


    private
    def user_params
        params.require(:user).permit(:first_name, :last_name, :password, :password_confirmation, :email)
    end
end
