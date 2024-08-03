Rails.application.routes.draw do
  post 'messages/receive', to: 'messages#receive'
end
