class ZoosController < ApplicationController

    before_action :redirect_if_not_logged_in?

    def index
        @zoos = Zoo.all
    end
    
    def new 
        if params[:location_id] &&  @location = Location.find_by_id(params[:location_id])
        
            @zoo = @location.zoo.build
        else
            @zoo = Zoo.new
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

    # def destroy
    #     @zoo = Zoo.find_by_id(params[:id])
    #     @zoo.destroy
    #     redirect_to zoos_path
    # end

    private

    def zoo_params
        params.require(:zoo).permit(:name, :location_id)
    end


end
