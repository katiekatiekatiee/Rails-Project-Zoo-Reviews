class SessionsController < ApplicationController
    
    def welcome 
        render :layout => 'welcome'
    end

    def new
        
    end

    def create
        user = User.find_by_email(params[:user][:email])
        #byebug
        if user && user.authenticate(params[:user][:password])
            session[:user_id] = user.id
            redirect_to zoos_path
        else
            flash[:message] = "Invalid Email or Password. Please try again."
            redirect_to login_path
        end
    end

    def omniauth
        user = User.from_omniauth(auth)
        
        if user.valid? 
            session[:user_id] = user.id
            redirect_to zoos_path
        else
            redirect_to login_path
        end
    end

    def destroy
        session.delete(:user_id)
        redirect_to root_path
    end

    private

    def auth
      request.env['omniauth.auth']
    end

end