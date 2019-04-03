Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'user#index'
  ##############################################################################
  post 'user/login' => 'user#login'
  get 'user/logout' => 'user#logout'
  get 'user/dashboard' => 'user#dashboard'
  get 'user/account_management' => 'user#account_management'
  get 'user/recommends' => 'user#recommends'
  get 'user/metadata' => 'user#metadata'
  get 'user/notifications' => 'user#notifications'
  post 'user/import' => 'user#import'
end
