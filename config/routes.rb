Rails.application.routes.draw do
  
  # You can have the root of your site routed with "root"
   root 'home#index'

    get 'welcome', to: 'home#landing'
  # Example resource route (maps HTTP verbs to controller actions automatically):
    devise_for :users, controllers: {sessions: 'users/sessions', registrations: 'users/registrations', passwords: 'users/passwords'}
    devise_scope :user do
      get '/users/sign_out' => 'devise/sessions#destroy'
    end

    resources :users, only: [:show, :index, :delete]

    resources :projects
    
    resources :skills 

    resources :listings, only: [:index, :edit]
    resources :talents, only: [:index]

    
  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
