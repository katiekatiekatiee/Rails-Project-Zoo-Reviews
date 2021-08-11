class ReviewsController < ApplicationController
    
    before_action :redirect_if_not_logged_in?

    def index
        @reviews = Review.all
    end
    
    def new
        if params[:zoo_id] && @zoo = Zoo.find(params[:id])
            @review = @zoo.review.build
        else
            @review = Review.new
        end
    end

    def create
        @review = Review.new(review_params)
        #byebug
        if params[:zoo_id]
            @zoo = Zoo.find(params[:id])

        end
        
        @review.user = current_user 
        
        if @review.save
            
            redirect_to review_path(@review)
        else
            render :new
        end
    end 

    def edit
        @review = Review.find(params[:id])
        redirect_if_not_authenticated 
    end

    def update 
        @review = Review.find(params[:id])
         if @review.update(review_params)
            redirect_to review_path(@review)
         else
            render :edit
         end
    end

    def show 
        @review = Review.find(params[:id])
    end

    def destroy
        @review = Review.find(params[:id])
        redirect_if_not_authenticated 
       if @review.delete
        redirect_to reviews_path
       end
    end
    

    private
    def review_params
        params.require(:review).permit(:title, :content, :zoo_id)
    end

    def redirect_if_not_authenticated 
        if @review.user != current_user 
          redirect_to reviews_path
        end
      end

end
