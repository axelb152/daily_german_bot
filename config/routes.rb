require 'sidekiq/web'

Rails.application.routes.draw do
  post 'messages/receive', to: 'messages#receive'
  mount Sidekiq::Web => '/sidekiq'
end
