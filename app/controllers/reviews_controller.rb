class ReviewsController < ApplicationController
  before_action :set_review, only: [:show, :edit, :update]
  before_action :authorize

  # GET /reviews/1
  # GET /reviews/1.json
  def show
  end

  # GET /reviews/new
  def new
  end

  #CREATE Review
  def create

    @product = Product.find(params[:product_id])
    @review = @product.new_review(review_params, current_user)
    @review.user = current_user

    if @review.save
      redirect_to product_path(@product), notice: 'Review Saved!'
    else
      redirect_to product_path(@product)
    end

  end


  # DELETE Review
  def destroy
    @review = Review.find params[:id]
    @review.destroy

    @product = Product.find params[:product_id]
    redirect_to product_path(@product), notice: 'Review deleted!'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_review
      @review = Review.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def review_params
      params.require(:review).permit(:description, :rating, :product_id, :user_id)
    end
end
