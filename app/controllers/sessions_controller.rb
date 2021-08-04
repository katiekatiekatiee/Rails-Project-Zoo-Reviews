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

    def omniauth
        @user = User.find_or_create_by(uid: auth['uid']) do |u|
            u.name = auth['info']['name']
            u.email = auth['info']['email']
            u.image = auth['info']['image']
          end
      
        session[:user_id] = @user.id
      
        render 'welcome/home'
    end

    def destroy
        session.delete(:user_id)
        redirect_to zoos_path
    end

    private

    def auth
      request.env['omniauth.auth']
    end

end