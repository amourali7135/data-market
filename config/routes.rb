Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "registrations" }
  root to: 'pages#home'

  resources :sellers do
    resources :data, except: [:index]
  end

  resources :buyers do
    resources :inquiries#, except: [:index]
  end

  resources :inquiries, only: [:index]

  resources :orders, except: [:index]

  resources :trades, except: [:index]

  resources :reviews, except: [:index]

  resources :sellerinquiries, only: [:create, :update] # :show

  # resources :data_types

  get 'about', to: 'pages#about', as: 'about'
  get 'buyerdashboard', to: 'pages#buyerdashboard', as: 'buyerdashboard'
  get 'contact', to: 'pages#contact', as: 'contact'
  get "help", to: "pages#help", as: 'help'
  get 'registered', to: 'pages#registered', as: 'registered'
  get 'sellerdashboard', to: 'pages#sellerdashboard', as: 'sellerdashboard'
  get 'liked', to: 'pages#liked', as: 'liked'

  get 'inquiry/:id/likes', to: 'inquiries#likes', as: :inquiry_likes
  get 'inquiry/:id/unlike', to: 'inquiries#unlikes', as: :inquiry_unlikes
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/search' => 'search#index'

  resources :conversations do
    resources :messages
  end

  post 'submit', to: 'sellers#submit', as: :submit

end
