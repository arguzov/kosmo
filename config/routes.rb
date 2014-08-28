Kosmo::Application.routes.draw do
  resources :orders
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
  get 'thanks'=>'posts#thanks', as: :thanks
  get 'gallery'=>'posts#gallery', as: :gallery

  get 'shop', to: redirect('/shop/collection/a_nox')
  #get 'shop'=>'shop#root', as: :shop_root
  get 'shop/collection/:url'=>'shop#collection', as: :shop_collection
  get 'shop/product/:url.html'=>'shop#product', as: :shop_product
  get 'shop/data/cart'=>'shop#cart_data'
  get 'shop/cart'=>'shop#cart', as: :shop_cart
  get 'shop/order/:id'=>'shop#order', as: :shop_order
  get 'shop/orders'=>'shop#orders', as: :shop_orders
  get 'shop/:url'=>'shop#unit', as: :shop_unit

  get 'private/profile'=>'private#profile', as: :private_profile

  get '/404' => 'errors#not_found'
  get '/422' => 'errors#server_error'
  get '/500' => 'errors#server_error'

  get '/fotoepilyatsiya-na-apparate-record-618.html', to: redirect('/services/1-fotoepilyacia.html')
  get '/prajs.html', to: redirect('/services/prices')
  get '/spetsialisty.html', to: redirect('/experts/')
  get '/chistki-litsa.html', to: redirect('/services/6-chistka-lica.html')
  get '/depilyatsiya/162-shugaring.html', to: redirect('/services/3-saharnaya-epilyacia.html')
  get '/kontakty.html', to: redirect('/contacts')
  get '/konsultatsiya-dermatologa-kosmetologa.html', to: redirect('/services/5-konsultaciya-kosmetologa.html')
  get '/voskovaya-epilyatsiya.html', to: redirect('/services/2-voskovaya-epilyacia.html')
  get '/konturnaya-plastika-korrektsiya-fillerami.html', to: redirect('/services/12-konturnaya-plastika-korrektsiya-fillerami.html')
  get '/otzyvy.html', to: redirect('/responces')
  get '/mezoterapiya-litsa.html', to: redirect('/services/14-mezoterapiya.html')
  get '/pedikyur/76-apparatnyj-pedikyur-kazan.html', to: redirect('/services/59-apparatnyj-pedikyur-kazan.html')
  get '/mezoterapiya-litsa/132-f-btx-gialuronovaya-kislota-peptidy.html', to: redirect('/services/14-mezoterapiya.html')
  get '/biorevitalizatsiya.html', to: redirect('/services/15-biorevitalizacia.html')
  get '/massazh-tela.html', to: redirect('/services/38-massag-tela.html')




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
