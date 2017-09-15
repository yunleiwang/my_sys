Rails.application.routes.draw do
  resources :observes
  get 'statistics/index'
  get 'statistics/index2'
  get 'statistics/index_data'
  get 'statistics/index2_data'
  get 'statistics/by_month_data'

  get 'statistics/by_month'

  get 'statistics/by_day'

  get 'statistics/by_hour'
  get 'statistics/by_hour_json'
  get 'statistics/relative_json'
  get 'statistics/sleep_wake_json'

  resources :item_value_orders
  resources :item_values
  resources :menus_crf_infos
  resources :public_libs
  resources :patient_visits do
    collection do
      get 'today_visits'
    end
  end
  resources :patients do
    member do
      get 'show_form'
    end
  end
  resources :menus
  resources :item_group_metaelements
  resources :item_form_metaelements
  resources :crf_infos
  resources :item_group_metadata
  resources :item_groups do
    member do
      get 'add_item_group'
      get 'remove_item_group'
    end
  end
  resources :item_form_data
  resources :items
  resources :sections
  resources :crves
  resources :search_condition do
    collection do
      get :index
      post :index
      get :index2
      get :add_condition
      get :remove_condition
      get :add_section
      get :add_item
      get :export2excel
    end
  end
  resources :sys_exports
  get 'home/index'
  devise_for :users
  devise_scope :user do
    authenticated :user do
      root 'home#index', as: :authenticated_root
    end
    unauthenticated do
      root 'devise/sessions#new', as: :unauthenticated_root
    end
  end
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'home#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

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
