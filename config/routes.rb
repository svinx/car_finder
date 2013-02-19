CarCompass::Application.routes.draw do

  get "car_articles/new"

  devise_for :admins

  devise_for :dealers

  resources :dealers do
    resources :vehicles, :path => 'vehicle'
  end

  resources 'car-articles', :as => :articles, :controller => :articles

  #scope :contraints => { :protocol => 'https' } do
  resources :charges
  #end


  resources :buyers

  resources 'sold-vehicles', :as => :sold_vehicles, :controller => :sold_vehicles

  match 'vehicles/search' => 'vehicles#search'

  resources :vehicles

  match 'dealer/:id/all-vehicles' => 'dealer_vehicles#index', :as => :dealer_inventory

  match 'dealers/:dealer_id/vehicles/:id' => 'vehicles#old_show_vehicle'

  #Admin--------------------------------------------------------------------
  match 'all-articles' => 'articles#all_articles', :as => :all_articles
  ######-----------------------------------------------------------------------

  match 'find-car/success' => 'buyers#success'

  #contact_dealers-------------------------------------------------------------
  #match 'email-dealer'  => 'email_dealers#email_dealer_about_car', :as => 'email_dealer', :via => :get
  match 'email-dealer' => 'email_dealers#new', :as => 'email_dealer', :via => :get
  match 'email-dealer'  => 'email_dealers#create', :as => 'email_dealer', :via => :post
  ######-----------------------------------------------------------------------

  #contact_form----------------------------------------------------------------
  match 'contact'          => 'contact#new', :as => 'contact', :via => :get
  match 'contact'          => 'contact#create', :as => 'contact', :via => :post
  ######-----------------------------------------------------------------------

  #response_router-------------------------------------------------------------
  match 'router/response-sms'                       => 'routers#response_sms'
  ######-----------------------------------------------------------------------

  match 'incoming-payments'  => 'incoming_payments#create', :via => :post

  #general_pages---------------------------------------------------------------
  match 'thank-you'                     => 'pages#thank_you', :as => :thank_you
  match 'privacy'                       => 'pages#privacy'
  match 'how-it-works'                  => 'pages#how_it_works'
  match 'about'                         => 'pages#about'
  match 'car-articles'                  => 'pages#car_articles'
  root :to                              => 'buyers#new'
  ######-----------------------------------------------------------------------
end
