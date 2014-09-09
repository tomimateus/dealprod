DealHunter::Application.routes.draw do

  resources :clients_companies


  resources :newsletter_frequencies


  match 'pages/work_with_us' => 'pages#work_with_us'
  match 'pages/form_company' => 'pages#form_company'
  match 'pages/faqs' => 'pages#faqs'
  match 'pages/contact' => 'pages#contact'
  match 'pages/form_contact' => 'pages#form_contact'
  match 'pages/contact_potential_advertiser' => 'pages#contact_potential_advertiser'
  match 'pages/contact_work_with_us' => 'pages#contact_work_with_us'
  match 'pages/contact_recommendation' => 'pages#contact_recommendation'
  match 'pages/we' => 'pages#we'
  match 'pages/terms_and_conds' => 'pages#terms_and_conds'
  match 'users/offers_company_user' => 'users#offers_company_user'
  match 'users/offers_client_user' => 'users#offers_client_user'
  match 'users/titles_user' => 'users#titles_user'
  match 'users/save_titles_user' => 'users#save_titles_user'
  match 'users/branches_company_user' => 'users#branches_company_user'
  match 'users/newsletter_freq' => 'users#change_newsletter_frequency'
  match 'users/home' => 'users#home'
  match 'users/home_view' => 'users#home_view'
  match 'users/home_map' => 'users#home_map'
  match 'users/inscribe' => 'users#inscribe'
  match 'users/unsubscribe' => 'users#unsubscribe'
  match 'send/newsletter' => 'pages#sendNewsletter'
  match 'send/endOfferMail' => 'pages#sendEndOfferMail'
  match 'send/recommendOfferMail' => 'pages#recommendOfferMail'

  match 'offers/results' => 'offers#results'
  match 'offers/save_results' => 'offers#save_results'

  match 'users/statistics' => 'users#statistics'


  root :to => "users#home"

  resources :countries

  resources :clients_offers

  resources :offers_titles

  resources :client_titles

  resources :titles

  resources :prizes

  resources :offers

  resources :branches

  resources :addresses

  devise_for :users, :controllers => { :registrations => "registrations", :passwords => "passwords"}

  resources :clients

  resources :companies

  resources :user_roles

  resources :users

  resources :passwords


  devise_for :admin_users, ActiveAdmin::Devise.config

  ActiveAdmin.routes(self)


  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
