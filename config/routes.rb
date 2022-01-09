Rails.application.routes.draw do
  get "/home/about"=>"homes#about" ,as: "about"
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
  }
  root to:'homes#top'
  resources :users
  resources :books
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
