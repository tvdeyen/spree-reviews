class ReviewsController < Spree::BaseController
  
  before_filter :check_authorization
  
  def index
    @product = Product.find_by_permalink params[:product_id]
    @approved_reviews = Review.approved.find_all_by_product_id(@product.id)
  end
  
  def new
    @product = Product.find_by_permalink params[:product_id]
    @review = @product.reviews.new
  end
  
  def create
    @product = Product.find_by_permalink(params[:product_id])
    @review = @product.reviews.new(params[:review])
    if @review.save
      flash[:notice] = t('review_successfully_sumbitted', :default => 'Review was successfully submitted.')
      redirect_to product_path(@product)
    else
      render :action => "new"
    end
  end
  
private
  
  def check_authorization
    authorize! :create, Order
  end
  
end
