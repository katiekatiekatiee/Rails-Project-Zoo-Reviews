class LocationsController < ApplicationController

    before_action :redirect_if_not_logged_in?

    def index
        @locations = Location.all
    end

end
