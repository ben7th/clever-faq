require 'sidekiq/web'

Rails.application.routes.draw do
  # 即时消息
  mount ActionCable.server => '/cable'

  # 队列监控
  mount Sidekiq::Web => '/sidekiq'

  # 用户验证
  devise_for :users, controllers: { 
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  root to: 'index#index'
  
  namespace :demo do
    get 'voice' => 'voice#show'
    get 'link' => 'link#show'
  
    get '' => 'index#index', as: :landing
    get 'auth' => 'index#auth', as: :auth
  end
end