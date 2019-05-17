Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'user#index'
  ##############################################################################
  post 'user/login' => 'user#login'
  get 'user/logout' => 'user#logout'

  get 'user/recommends' => 'user#recommends'
  ##############################################################################
  get 'user/account_management' => 'account_management#account_management'
  post 'user/profile_update' => 'account_management#profile_update'
  post 'user/password_update' => 'account_management#password_update'
  ##############################################################################
  get 'user/dashboard' => 'dashboard#dashboard'
  ##############################################################################
  get 'user/notifications' => 'notifications#notifications'
  ##############################################################################
  get 'user/courses' => 'courses#courses'
  post 'user/import' => 'courses#import'
  get 'user/new_course' => 'courses#new_course'
  post 'user/create' => 'courses#create'
  post 'user/update' => 'courses#update'
  get 'courses/detail' => 'courses#course_detail'
  get 'courses/detail/items' => 'courses#item_detail'
  get 'courses/new_item' => 'courses#new_item'
  post 'courses/create_atom' => 'courses#create_atom'
  end
