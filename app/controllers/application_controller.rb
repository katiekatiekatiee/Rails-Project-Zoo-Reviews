class ApplicationController < ActionController::Base

    private 
    def redirect_if_not_logged_in? 
        redirect_to login_path if !logged_in?
    end

    def current_user 
        @current_user ||= User.find_by_id(session[:user_id])
    end

    def logged_in?
        !!current_user
    end
end
