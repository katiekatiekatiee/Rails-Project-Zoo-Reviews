class ZoosController < ApplicationController
    def index
        @zoos = Zoo.all
    end
    
    def new 
        if params[:location_id] &&  @location = Location.find_by_id(params[:location_id])
        
            @zoo = @location.zoos.build
        else
            @zoo = Zoo.new
            @zoo.build_location
        end
    end

    def create 
        @zoo = Zoo.new(zoo_params)
        if params[:location_id]
            @location = Location.find_by_id(params[:location_id])
        end
        
        if @zoo.save
            redirect_to zoos_path
        else
            render :new
        end
    end

    
    def show
        @zoo = Zoo.find_by_id(params[:id])
    end

    private

    def zoo_params
        params.require(:zoo).permit(:name, location_attributes:[:state])
    end

end
