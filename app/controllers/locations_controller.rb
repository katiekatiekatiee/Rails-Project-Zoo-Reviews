class LocationsController < ApplicationController

    before_action :redirect_if_not_logged_in?

    def index
        @locations = Location.all
    end

    def show
        @location = Location.find_by_id(params[:id])
    end

   

end
