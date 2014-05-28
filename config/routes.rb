AgentSignals::Application.routes.draw do

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users

  devise_scope :user do
    root to: "devise/sessions#new"
    get "logout",     to: "devise/sessions#destroy",    as: "logout"
    get "login",      to: "devise/sessions#new",        as: "login"
    get "signup",     to: "devise/registrations#new",   as: "signup"
  end

  get 'searches/show'

  mount Bootsy::Engine => '/bootsy', as: 'bootsy'
  get "contact_form/new"
  get "contact_form/create"

  resources :users
  get "dashboard",  to: "users#dashboard"

  get "web_to_lead" => "leads#new_web_lead", as: "web_to_lead"
  put "create_web_lead" => "leads#create_web_lead", as: "create_web_lead"
  put "generate" => "leads#external_form"

  get 'contact_us' => 'contact_forms#new', as: 'contact_us'
  get 'pricing' => 'pages#pricing', as: 'pricing'

  # Wizards
  resources :after_signup

  resources :agents
  resources :listings
  resources :offers
  resources :opportunities
  resources :tasks
  resources :calendar
  resources :events do
    get :new_task,          on: :collection
    get :new_appointment,   on: :collection
    get :new_showing,       on: :collection
  end

  resources :users do 
    get :settings, on: :member
  end
  resources :leads do
    resources :notes
  end

  resources :leads do
    member do
      post :convert_to_client
      get :convert
    end
  end

  resources :clients

  namespace :admin do
    resources :users
    resources :organizations
  end

  resources :contact_forms

  resources :contacts
  resources :accounts do
    member do
      get :settings
      post :add_user
    end
  end


end

