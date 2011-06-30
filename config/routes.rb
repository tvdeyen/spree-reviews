Rails.application.routes.draw do
  
  namespace :admin do
    resources :reviews do
      member do
        put 'approve'
      end
    end
    resource :review_settings
  end
  
  resources :products do
    resources :reviews
  end
  
end
