Kosmo::Application.routes.draw do

  # dsfsdfsdf
  get '/promos/58', to: redirect('/services/79-lasernaya-epilyaciya.html')
  get '/promos/top_banner'=>'promos#top_banner'

  resources :faqs

  resources :orders do
      get 'kassa/:id'=>'orders#kassa', on: :collection
      get 'lazer'=>'orders#lazer', on: :collection
      get 'complete'=>'orders#complete', on: :collection
  end
  resources :promos
  resources :videos
  resources :experts
  resources :subscriptions do
      get 'section/:id'=>'subscriptions#section', on: :collection
      get 'send'=>'subscriptions#send_mail', on: :collection
  end
  resources :medicaments

  resources :certificates do
      get 'set'=>'certificates#set', on: :collection
      get 'sum'=>'certificates#sum', on: :collection
  end

  post 'api/metrika/register'=>'metrika#register', as: :metrika_register
  get 'services/79-lasernaya-epilyaciya.html' => 'services#lazer', as: :lazerepil
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
  get 'contacts'=>'posts#contacts', as: :contacts_index
  get 'contacts/:id'=>'posts#contacts', as: :contacts
  get 'thanks'=>'posts#thanks', as: :thanks
  get 'gallery'=>'posts#gallery', as: :gallery

  get 'shop'=>'shop#main', as: :shop
  get 'store'=>'shop#index', as: :shop_index
  get 'shop/search'=>'shop#search', as: :shop_search
  get 'shop/bestsellers'=>'shop#best_sellers', as: :shop_best_sellers
  #get 'shop'=>'shop#root', as: :shop_root
  get 'shop/collection/:url'=>'shop#collection', as: :shop_collection
  get 'shop/product/:url.html'=>'shop#product', as: :shop_product
  get 'shop/data/cart'=>'shop#cart_data'
  get 'shop/cart'=>'shop#cart', as: :shop_cart
  get 'shop/order/:id'=>'shop#order', as: :shop_order
  get 'shop/orders'=>'shop#orders', as: :shop_orders
  get 'shop/:url'=>'shop#unit', as: :shop_unit
  get 'about'=>'posts#about', as: :about

  get 'api/typehead/services'=>'services#typehead_list', as: :api_typehead_services

  get 'services/lazer.html' => 'services#lazer', as: :services_lazer

  namespace :manager do
      resources :orders
      resources :prices
      resources :users
      get 'metrika' => 'metrika#index'
      get 'metrika/service/all' => 'metrika#all'
      get 'metrika/service/:service_id' => 'metrika#service'
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

end
