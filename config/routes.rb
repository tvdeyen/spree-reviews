Rails.application.routes.draw do
  
  namespace :admin do
    resources :reviews
    resource :review_settings
  end
  
  resources :products do
    resources :reviews # , :member => {:submit => :post}
  end
  
end
