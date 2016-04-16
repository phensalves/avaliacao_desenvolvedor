Rails.application.routes.draw do
  resources :sales do
    collection { post :import }
  end

  root 'sales#index'
  
end
