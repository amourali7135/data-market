Rails.application.routes.draw do
  get 'search/index'
  get 'reviews/new'
  get 'reviews/create'
  get 'reviews/show'
  get 'reviews/update'
  get 'reviews/destroy'
  get 'reviews/edit'
  get 'transactions/new'
  get 'transactions/create'
  get 'transactions/show'
  get 'transactions/update'
  get 'transactions/destroy'
  get 'transactions/edit'
  get 'inquiries/new'
  get 'inquiries/create'
  get 'inquiries/show'
  get 'inquiries/update'
  get 'inquiries/destroy'
  get 'inquiries/edit'
  get 'payments/new'
  get 'payments/create'
  get 'payments/show'
  get 'payments/update'
  get 'payments/destroy'
  get 'payments/edit'
  get 'data/new'
  get 'data/create'
  get 'data/show'
  get 'data/update'
  get 'data/destroy'
  get 'data/edit'
  get 'buyers/index'
  get 'buyers/new'
  get 'buyers/create'
  get 'buyers/show'
  get 'buyers/update'
  get 'buyers/destroy'
  get 'buyers/edit'
  get 'sellers/index'
  get 'sellers/new'
  get 'sellers/create'
  get 'sellers/show'
  get 'sellers/update'
  get 'sellers/destroy'
  get 'sellers/edit'
  devise_for :users
  root to: 'pages#home'

  resources :sellers do
    resources :data, except: [:index]
  end

  resources :buyers do
    resources :inquiries, except: [:index]
  end

  resources :payments, except: [:index]

  resources :transactions, except: [:index]

  resources :reviews, except: [:index]

  get 'about', to: 'pages#about', as: 'about'
  get 'buyerdashboard', to: 'pages#buyerdashboard', as: 'buyerdashboard'
  get 'contact', to: 'pages#contact', as: 'contact'
  get "help", to: "pages#help", as: 'help'
  get 'registered', to: 'pages#registered', as: 'registered'
  get 'sellerdashboard', to: 'pages#sellerdashboard', as: 'sellerdashboard'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
