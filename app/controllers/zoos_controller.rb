class ZoosController < ApplicationController

    before_action :redirect_if_not_logged_in?

    def index
        if params[:location_id] &&  @location = Location.find(params[:location_id])
            @zoos = @location.zoos
        else
            @zoos = Zoo.order_by_name
        end
    end
    
    def new 
        if params[:location_id] &&  @location = Location.find(params[:location_id])
            @zoo = @location.zoos.build
        else
            @zoo = Zoo.new
        end
        @zoo.reviews.build
    end

    def create 
        @zoo = Zoo.new(zoo_params)
        if params[:location_id]
            @location = Location.find(params[:location_id])
        end
        @zoo.reviews.each do |review|
            review.user = current_user
        end
        if params[:location_id]
            @location = Location.find(params[:id])
        end
        
        if @zoo.save   
            redirect_to zoos_path
        else
            render :new
        end
    end

    
    def show
        @zoo = Zoo.find(params[:id])
    end

    # def destroy
    #     @zoo = Zoo.find_by_id(params[:id])
    #     @zoo.destroy
    #     redirect_to zoos_path
    # end

    private

    def zoo_params
        params.require(:zoo).permit(:name, :location_id, reviews_attributes:[:title, :content])
    end


end
