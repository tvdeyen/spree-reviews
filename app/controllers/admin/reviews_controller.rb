class Admin::ReviewsController < Admin::ResourceController
  
  def index
    @unapproved_reviews = Review.not_approved.order("created_at DESC")
    @approved_reviews   = Review.approved.order("created_at DESC")
    respond_with(@unapproved_reviews, @approved_reviews) do |format|
      format.html
    end
  end
  
  def approve
    r = Review.find(params[:id])
    r.approved = true
    if r.product.rating.nil? 
      r.product.rating = Rating.create :value => 0, :count => 0
    end
    r.product.rating.add_rating(r.rating)
    if r.save
       flash[:notice] = t("info_approve_review")
    else
       flash[:error] = t("error_approve_review")
    end
    redirect_to admin_reviews_path
  end
  
end
