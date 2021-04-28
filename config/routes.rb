Rails.application.routes.draw do
  root "events#index"
  resources :users, only: [:new, :create, :show]
  resources :sessions, only: [:new, :create, :destroy]
  resources :events
  post '/event/:id/attend', to: "events#attend", as: "attend_event"
  post '/event/:id/unattend', to: "events#unattend", as: "unattend_event"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
