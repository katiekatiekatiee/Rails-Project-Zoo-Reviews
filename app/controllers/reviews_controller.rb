class ReviewsController < ApplicationController
    
    def index
        @reviews = Review.all
    end
    
    def new
        @review = Review.new
    end

    def create
        @review = Review.new(review_params)
        @review.title = params[:title]
        @review.content = params[:content]

        review.save
        redirect_to review_path(@review)
    end 

    def edit
    end

    def update 
    end

    def show 
    end

    def destroy
    end
    

    private
    def review_params
        params.require(:review).permit(:title, :content)
    end

end
