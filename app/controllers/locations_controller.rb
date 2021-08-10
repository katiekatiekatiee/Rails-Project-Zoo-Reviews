class LocationsController < ApplicationController

    before_action :require_login

    def index
        @locations = Location.all
    end

    def show
        @location = Location.find_by_id(params[:id])
    end

    private
    def require_login
        return head(:forbidden) unless session.include? :user_id
      end

end
