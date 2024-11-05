Rails.application.routes.draw do

  devise_for :young_users, controllers:{
    confirmations: 'young/confirmations',
    passwords:  'young/passwords',
    registrations: 'young/registrations',
    sessions: 'young/sessions',
    unlocks: 'young/unlocks'
     }


     
   devise_scope :young_user do
    post "young_users/guest_sign_in", to: "young/sessions#guest_sign_in"
  end
    
    
  scope module: :young do
    resources :wisdom_posts, only: [:index, :show, :edit, :create, :destroy, :update] do
      resources :wisdom_post_comments, only: [:create]
    end
    resources :young_users, only: [:index, :show, :edit, :update, :destroy]
    get '/search', to: 'searches#search'
  end


  
  root to: 'homes#top'
  get 'homes/about'
 
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
