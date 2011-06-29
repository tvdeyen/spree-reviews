class Admin::ReviewSettingsController < Admin::BaseController
  
  def update
    # workaround for unset checkbox behaviour
    params[:preferences][:include_unapproved_reviews] = false if params[:preferences][:include_unapproved_reviews].blank?
    @config = Spree::Editor::Config.instance
    @config.update_attributes(params[@config.class.name.underscore])
    Rails.cache.delete("configuration_#{@config.class.name}".to_sym)
    redirect_to admin_review_settings_path
  end
  
end
