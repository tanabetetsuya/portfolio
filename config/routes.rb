Rails.application.routes.draw do
  devise_for :admins
  namespace :admin do
    get 'inquiries/index'
     get 'homes/top'
  end

  devise_for :users, :controllers => {
    :registrations =>'users/registrations',
    :sessions => 'users/sessions'
  }
  devise_scope :user do
    get "sign_in", :to => "users/sessions#new"
    get "sign_out", :to => "users/sessions#destroy"
  end
  root to: 'homes#top'
  resources :exercise_menus, only: [:new, :create, :show, :index]
  get '/exercise_menus/:id/registration' => 'exercise_menus#registration'
  resources :users, only: [:show, :index, :edit, :update] do
    resource :likes, only: [:create, :destroy]
    resources :comments, only: [:create, :destroy]
  end
  get '/users/check' => 'users#check'
  put '/users' => 'users#resign'
  resources :exercise_suggestions, only: [:index, :create]
  resources :exercises, only: [:new, :create, :show]
  resources :today_exercises, only: [:new, :create, :edit, :update, :destroy]
  resources :inquiries, only: [:new, :create]
  post '/inquiries/:id/confirm' => 'inquiries#confirm'
  get '/inquiries/complete' => 'inquiries#complete'
  resources :events

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
