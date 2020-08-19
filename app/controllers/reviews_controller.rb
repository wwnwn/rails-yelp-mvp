class ReviewsController < ApplicationController

    def new
        @restaurant = Restaurant.find(params[:restaurant_id])
        @review = Review.new
      end
    
    
      # POST /restaurants/:restaurant_id/reviews
      def create
        # get the params from the form
        @review = Review.new(review_params)
        # find the right restaurant
        @restaurant = Restaurant.find(params[:restaurant_id])
        # Assign the restaurant id to the review.restaurant_id
        @review.restaurant = @restaurant
        # Save the review
        if @review.save
          redirect_to restaurant_path(@restaurant)
        else
          render :new
        end
      end
    
    
      # DELETE reviews/:id
      def destroy
        @review = Review.find(params[:id])
        @review.destroy
    
        redirect_to restaurant_path(@review.restaurant)
      end
    
    
      private
    
      def review_params
        params.require(:review).permit(:content)
      end
    
end
