Rails.application.routes.draw do

  get 'email/index'

  root to: 'static_pages#index'

  get '/api/tracker/tracker.jpg', to: 'tracker#show', as: 'tracking_pixel'
  post '/api/email/create', to: 'email#create', as: 'create_email'

end
