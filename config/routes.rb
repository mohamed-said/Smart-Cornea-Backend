Rails.application.routes.draw do
  devise_for :users, :controllers => {
    :registrations => "users/registrations",
    :sessions => "users/sessions"
  }

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  devise_scope :user do
    authenticated :user do
      root 'home#index', as: :authenticated_root
    end

    unauthenticated do
      root 'devise/sessions#new', as: :unauthenticated_root
    end

    get 'logout' => 'devise/sessions#destroy'
  end

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
    resources :users do
      member do
      end

      collection do
        post 'new'
      end
    end

    resources :followings do
      member do
        get "show"
      end

      collection do
        post 'create'
      end
    end

    resources :domains do
      member do
        get "state_file" => "domains#state_file"
        post "store_state_file" => "domains#store_state_file"
      end

      collection do
        post "create" => "domains#create"
        post "view_create" => "domains#view_create"
        get "show" => "domains#show"
      end
    end

    #api
    namespace :api do
      namespace :v1 do
        resources :users, only: [:index, :create, :show, :update, :destroy]
        resources :sessions do
          collection do
            post "register" => "sessions#register"
            post "login" => "sessions#login"
          end
        end
      end
    end

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
