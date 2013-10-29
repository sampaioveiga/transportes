Transportes::Application.routes.draw do
  resources :destinations,  except: [ :destroy ]
  resources :services,      except: [ :destroy ] do
    resources :bosses,      except: [ :show, :index ]
  end
  resources :ulsneunits,    except: [ :show, :destroy ]
  resources :users,         except: [ :destroy ] do
    resources :reqmaterials
    post '/reqmaterials/:id/validate' => 'reqmaterials#validate', as: :validate_reqmaterial
    resources :reqpeople
    post '/reqpeople/:id/validate' => 'reqpeople#validate', as: :validate_reqperson
  end
  resources :sessions,    except: [ :show, :edit, :update ]
  get 'static_pages/index' => 'static_pages#index'
  get 'static_pages/reqmaterials' => 'static_pages#reqmaterials'
  get 'static_pages/reqpeople' => 'static_pages#reqpeople'
  match '/signin',  to: 'users#new',        via: 'get'
  match '/login',   to: 'sessions#new',     via: 'get'
  match '/logout',  to: 'sessions#destroy', via: 'get'
  root 'static_pages#index'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

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
