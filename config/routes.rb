Rails.application.routes.draw do
  resources :promo_messages
  resources :promo_message_recipients, only: :index
end
