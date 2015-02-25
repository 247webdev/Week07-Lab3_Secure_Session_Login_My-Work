Rails.application.routes.draw do
  root 'access#login'

  get '/login', to: "access#login", as: 'login'

  get '/signup', to: "access#signup", as: 'signup'

  post '/login', to: "access#attempt_login"

  post '/signup', to: "access#create"

  get '/home', to: "access#home", as: 'home'

  delete '/logout', to: "access#logout", as: "logout"
end
