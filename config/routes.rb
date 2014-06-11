Kosmo::Application.routes.draw do
  resources :promos

  resources :experts

  resources :medicaments

  #resources :services do
  #    get 'prices', on: :collection
  #end
  get 'services/:id-:url.html'=>'services#show', as: :service
  get 'services'=>'services#index', as: :services
  get 'services/prices'=>'services#prices', as: :prices_services

  get 'issues/:url.html'=>'issues#show', as: :issue, :constraints => {:url => /.*/}
  get 'issues'=>'issues#index', as: :issues
  #resources :issues

  mount RedactorRails::Engine => '/redactor_rails'
  ActiveAdmin.routes(self)
  devise_for :users
  resources :categories

  resources :posts


  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'posts#root'
  get 'responces'=>'posts#reviews', as: :responces
  get 'news'=>'posts#news', as: :news
  get 'contacts'=>'posts#contacts', as: :contacts

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
