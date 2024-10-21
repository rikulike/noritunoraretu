Rails.application.routes.draw do


scope module: :young do
  devise_for :young_users, controllers:{
    confirmations: 'young/confirmations',
    passwords:  'young/passwords',
    registrations: 'young/registrations',
    sessions: 'young/sessions',
    unlocks: 'young/unlocks'
     }
     
     resources :wisdom_posts, only: [:index, :show, :edit, :create, :destroy, :update]
     resources :young_users, only: [:index, :show, :edit, :update]
end


  
  root to: 'homes#top'
  get 'homes/about'
 
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
