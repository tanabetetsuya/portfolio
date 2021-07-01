Rails.application.routes.draw do
  namespace :admin do
    get 'inquiries/index'
  end
  namespace :admin do
    get 'homes/top'
  end
  get 'events/new'
  get 'events/create'
  get 'events/edit'
  get 'events/update'
  get 'events/show'
  get 'events/index'
  get 'events/destroy'
  get 'comments/create'
  get 'comments/destroy'
  get 'likes/new'
  get 'likes/create'
  get 'inquiries/new'
  get 'inquiries/create'
  get 'today_exercises/new'
  get 'today_exercises/create'
  get 'today_exercises/edit'
  get 'today_exercises/update'
  get 'today_exercises/destroy'
  get 'exercises/new'
  get 'exercises/create'
  get 'exercises/show'
  get 'exercise_suggestions/index'
  get 'exercise_suggestions/create'
  get 'exercise_suggestion/index'
  get 'exercise_suggestion/create'
  get 'users/show'
  get 'users/edit'
  get 'users/update'
  get 'show/edit'
  get 'show/update'
  get 'exercise_menus/index'
  get 'exercise_menus/new'
  get 'exercise_menus/create'
  get 'exercise_menus/show'
  get 'homes/top'
  get 'homes/about'
  devise_for :admins
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
