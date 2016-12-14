Kosmo::Application.routes.draw do

  # dsfsdfsdf
  get '/promos/58', to: redirect('/services/79-lasernaya-epilyaciya.html')

  resources :faqs

  resources :orders do
      get 'kassa/:id'=>'orders#kassa', on: :collection
  end
  resources :promos
  resources :experts
  resources :subscriptions
  resources :medicaments

  resources :certificates do
      get 'set'=>'certificates#set', on: :collection
      get 'sum'=>'certificates#sum', on: :collection
  end

  #resources :services do
  #    get 'prices', on: :collection
  #end
  get 'services/:id-:url.html'=>'services#show', as: :service,  :constraints => {:id => /\d+/}
  get 'services'=>'services#index', as: :services
  get 'services/prices'=>'services#prices', as: :prices_services

  get 'issues/:url.html'=>'issues#show', as: :issue, :constraints => {:url => /.*/}
  get 'issues'=>'issues#index', as: :issues
  #resources :issues

  get 'section/:url.html'=>'sections#show', as: :section

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
  get 'contacts/:id'=>'posts#contacts', as: :contacts
  get 'thanks'=>'posts#thanks', as: :thanks
  get 'gallery'=>'posts#gallery', as: :gallery

  get 'shop'=>'shop#main', as: :shop
  get 'shop/bestsellers'=>'shop#best_sellers', as: :shop_best_sellers
  #get 'shop'=>'shop#root', as: :shop_root
  get 'shop/collection/:url'=>'shop#collection', as: :shop_collection
  get 'shop/product/:url.html'=>'shop#product', as: :shop_product
  get 'shop/data/cart'=>'shop#cart_data'
  get 'shop/cart'=>'shop#cart', as: :shop_cart
  get 'shop/order/:id'=>'shop#order', as: :shop_order
  get 'shop/orders'=>'shop#orders', as: :shop_orders
  get 'shop/:url'=>'shop#unit', as: :shop_unit

  get 'api/typehead/services'=>'services#typehead_list', as: :api_typehead_services

  namespace :manager do
      resources :orders
      resources :prices
      resources :users
      namespace :shop do
        resources :categories
        resources :products do
          post :update_field, on: :collection
        end
        namespace :product do
          resources :items
        end
      end
  end

  get 'private/profile'=>'private#profile', as: :private_profile

  get '/404' => 'errors#not_found'
  get '/422' => 'errors#server_error'
  get '/500' => 'errors#server_error'

  get '/fotoepilyatsiya-na-apparate-record-618.html', to: redirect('/services/1-fotoepilyacia.html')
  get '/prajs.html', to: redirect('/services/prices')
  get '/pedikyur.html', to: redirect('/services/57-pedikyur-klassicheskij-kazan.html')
  get '/credstva-protiv-vrastaniya-volos-i-zamedlyayushchie-rost-volos.html', to: redirect('/services/79-lasernaya-epilyaciya.html')
  get '/disport-botoks.html', to: redirect('/services/16-botulotoksiny.html')
  get '/obertyvanie-tela/98-obertyvanie-vsego-tela-listovymi-vodoroslyami.html', to: redirect('/services/25-obertyvanie-vsego-tela-listovymi-vodoroslyami.html')
  get '/plazmolifting/163-o-metode-plasmolifting-v-trikhologii.html', to: redirect('/services/28-o-metode-plasmolifting-v-trikhologii.html')
  get '/lechebnyj-manikyur-yaponskij-goryachij/79-yaponskij-manikyur-kazan.html', to: redirect('/services/63-yaponskij-manikyur-kazan.html')
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
