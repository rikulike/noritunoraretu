Rails.application.routes.draw do


scope module: :young do
  devise_for :young_users, controllers:{
    confirmations: 'young/confirmations',
    passwords:  'young/passwords',
    registrations: 'young/registrations',
    sessions: 'young/sessions',
    unlocks: 'young/unlocks'
     }
end

 
  resources :wisdom_posts, only: [:index, :show, :new, :edit, :create, :destroy, :update]
  root to: 'homes#top'
  get 'homes/about'
 resources :young_users, only: [:index, :show, :edit]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
