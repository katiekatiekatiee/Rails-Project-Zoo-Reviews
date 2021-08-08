class ReviewsController < ApplicationController
    
    def index
        @reviews = Review.all
    end
    
    def new
        if params[:zoo_id] && @zoo = Zoo.find_by_id(params[:zoo_id])
            @review = @zoo.review.build
        else
            @review = Review.new
        end
    end

    def create
        @review = Review.new(review_params)
        if params[:zoo_id]
            @zoo = Zoo.find_by_id(params[:zoo_id])
        end

        if @review.save
            redirect_to review_path(@review)
        else
            render :new
        end
    end 

    def edit
    end

    def update 
    end

    def show 
        @review = Review.find_by_id(params[:id])
    end

    def destroy
        @review = Review.find_by_id(params[:id])
        @review.delete
        redirect_to reviews_path
    end
    

    private
    def review_params
        params.require(:review).permit(:title, :content)
    end

end
