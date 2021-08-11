class ApplicationController < ActionController::Base

    rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

    include ApplicationHelper

    private 
    def redirect_if_not_logged_in? 
        redirect_to login_path if !logged_in?
    end

    def record_not_found(error)
        @message = error.message
        render :"layouts/error_page"
    end

end
