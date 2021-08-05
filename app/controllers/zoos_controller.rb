class ZoosController < ApplicationController
    def index
        @zoos = Zoo.all
    end

    def new
    end

    def create 
    end
    
    
    def show
        @zoo = Zoo.find_by_id(params[:id])
    end

end
