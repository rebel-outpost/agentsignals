AgentSignals::Application.routes.draw do

  get "contact_form/new"
  get "contact_form/create"

  # root to: "pages#index"

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users

  devise_scope :user do
    root to: "devise/sessions#new"
    get "logout" => "devise/sessions#destroy", as: "logout"
    get "login" => "devise/sessions#new", as: "login"
    get "signup" => "devise/registrations#new", as: "signup"
    get "dashboard" => "users#dashboard", as: "dashboard"
  end

  get "web_to_lead" => "leads#new_web_lead", as: "web_to_lead"
  put "create_web_lead" => "leads#create_web_lead", as: "create_web_lead"
  put "generate" => "leads#external_form"

  get 'contact_us' => 'contact_forms#new', as: 'contact_us'
  get 'pricing' => 'pages#pricing', as: 'pricing'

  resources :after_signup

  resources :calendar
  resources :listings

  resources :users
  resources :leads do
    resources :notes
  end

  resources :leads do
    member do
      get :convert
    end
  end

  namespace :admin do
    resources :users
    resources :organizations
  end

  resources :organizations

  resources :contact_forms
  resources :tasks
  resources :contacts
  resources :accounts do
    member do
      get :settings
      post :add_user
    end
  end

  resources :opportunities
end

