Rails.application.routes.draw do

devise_for :young_users, controllers:{
    confirmations: 'young/confirmations',
    passwords:  'young/passwords',
    registrations: 'young/registrations',
    sessions: 'young_users/sessions',
    unlocks: 'young/unlocks',
     
     }
     devise_scope :young_user do


 post "young_users/guest_sign_in", to: "young_users/sessions#guest_sign_in"
end
scope module: :young_users do
  
     
   
    
    resources :wisdom_posts, only: [:index, :show, :edit, :create, :destroy, :update]
    resources :young_users, only: [:index, :show, :edit, :update, :destroy]
    get '/search', to: 'seaches#search'
end


  
  root to: 'homes#top'
  get 'homes/about'
 
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
