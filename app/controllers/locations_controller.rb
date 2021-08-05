class LocationsController < ApplicationController

    def index
        @states = Location.all
    end

    def show
        @state = Location.find_by_id(params[:id])
    end

end
