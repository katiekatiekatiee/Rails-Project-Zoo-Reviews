class SessionsController < ApplicationController

    def new

    end

    def create
        user = User.find_by_email(params[:user][:email])
        if user && user.authenticate(params[:user][:password])
            session[:user_id] = user.id
            redirect_to zoos_path
        else
            flash[:message] = "Invalid Email or Password. Please try again."
            redirect_to login_path
        end
    end

    def destroy
        session.delete(:user_id)
        redirect_to zoos_path
    end

end