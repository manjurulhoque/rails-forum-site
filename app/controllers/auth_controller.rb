class AuthController < ApplicationController
    def new

    end

    def create
        user = User.find_by(email: params[:auth][:email].downcase)
        if user && user.authenticate(params[:auth][:password])
            session[:user_id] = user.id
            flash[:success] = "You have successfully logged in"
            redirect_to posts_path
        else
            flash.now[:danger] = "There was something wrong with your login information"
            render 'new'
        end
    end

    def destroy
        session[:user_id] = nil
        flash[:success] = "You have logged out"
        redirect_to root_path
    end
end
