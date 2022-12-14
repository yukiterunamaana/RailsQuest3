Rails.application.routes.draw do
   root "home#index"
   get '/characters', to: 'characters#index'
   get '/add/:unit', to: 'home#add'
end
