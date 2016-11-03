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
end