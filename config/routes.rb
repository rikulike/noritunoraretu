Rails.application.routes.draw do

  devise_for :young_users, controllers:{
    confirmations: 'young_users/confirmations',
    passwords:  'young_users/passwords',
    registrations: 'young_users/registrations',
    sessions: 'young_users/sessions',
    unlocks: 'young_users/unlocks'
     }
     
     
  resources :young_users, only: [:index, :show, :edit]
  resources :wisdom_posts, only: [:index, :show, :new, :edit]
  get 'homes/top'
  get 'homes/about'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
