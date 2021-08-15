Rails.application.routes.draw do
  devise_for :admins
  namespace :admin do
    get 'inquiries/index'
     get 'homes/top'
  end

  devise_for :users, controllers: {
    :registrations => 'users/registrations',
    :sessions => 'users/sessions',
    :omniauth_callbacks => 'users/omniauth_callbacks'
  }
  resources :users, only: [:show, :edit, :update, :index]
  root to: 'homes#top'
  post '/confirmation' => 'exercise_menus#confirmation'
  resources :exercise_menus, only: [:new, :create, :show, :index] do
    resources :comments, only: [:index, :create, :destroy]
    resource :likes, only: [:create, :destroy]
  end
  resources :exercise_videos, only: [:new, :create, :destroy, :index]
  resources :today_exercises, only: [:new, :create, :edit, :update, :destroy]
  resources :inquiries, only: [:index]
  post '/inquiries/confirmation' => 'inquiries#confirmation'
  get '/inquiries/confirmation' => 'inquiries#confirmation'
  post '/inquiries/complete' => 'inquiries#complete'
  get '/inquiries/complete' => 'inquiries#complete'
  resources :events
  resources :youtubes, only: [:new, :create, :index]


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
