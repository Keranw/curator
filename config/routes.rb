Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'user#index'
  ##############################################################################
  get 'user/index' => 'user#index'
  post 'user/login' => 'user#login'
  get 'user/logout' => 'user#logout'
  get 'user/new' => 'user#new'
  post 'user/follow_course' => 'user#follow_course'
  post 'user/unfollow_course' => 'user#unfollow_course'
  get 'user/recommends' => 'user#recommends'
  ##############################################################################
  get 'user/account_management' => 'account_management#account_management'
  post 'user/profile_update' => 'account_management#profile_update'
  post 'user/password_update' => 'account_management#password_update'
  post 'user/create_new_account' => 'account_management#create_new_account'
  get 'user/forget' => 'account_management#forget'
  post 'user/reset' => 'account_management#reset'
  ##############################################################################
  get 'user/dashboard' => 'dashboard#dashboard'
  ##############################################################################
  get 'password_reset/:token/index' => 'account_management#reset_index'
  post 'password_reset/reset' => 'account_management#reset_my_password'
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
  post 'courses/update_atom' => 'courses#update_atom'
  post 'courses/delete_atom' => 'courses#delete_atom'
  ##############################################################################
  get 'user/course_management' => 'courses#my_courses'
  get 'user/sidebar' => 'user#sidebar'
  end
