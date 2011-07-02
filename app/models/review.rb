class Review < ActiveRecord::Base
  
  belongs_to :product
  
  validates_presence_of :name, :location, :title, :review
  validates_numericality_of :rating, :only_integer => true
  
  scope :approved, where(:approved => true)
  scope :not_approved, where(:approved => false)
  
  scope :approval_filter, :conditions => ["(? = #{ActiveRecord::Base.connection.quoted_true}) || (approved = #{ActiveRecord::Base.connection.quoted_true})", Spree::Reviews::Config[:include_unapproved_reviews]]
  
  scope :oldest_first, :order => "created_at asc"
  scope :preview,      :limit => Spree::Reviews::Config[:preview_size], :order => "created_at desc"
  
end
