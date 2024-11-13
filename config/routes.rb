Rails.application.routes.draw do

  namespace :young do
   resources :groups, only: [:new, :show, :index, :create, :destroy, :update, :edit] do
     resource :group_young_users, only: [:create, :destroy] 
     resources :event_notices, only:[:new, :create]
   end
   
   resources :group_users, only: [:create, :destroy]
  end
  
  devise_for :admin, skip: [:registrations, :password], controllers: {
    sessions: 'admin/sessions'
  }

  namespace :admin do
    get 'dashboards', to: 'dashboards#index'
    resources :young_users, only: [:destroy, :show]
    resources :wisdom_posts, only: [:destroy]
    resources :wisdom_post_comments, only: [:destroy]
  end

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
    resources :wisdom_posts, only: [:index, :show, :edit, :create, :destroy, :update, :new] do
      resources :wisdom_post_comments, only: [:create]
    end
    resources :young_users, only: [:index, :show, :edit, :update, :destroy]
    get '/search', to: 'searches#search'
  end



  root to: 'homes#top'
  get 'homes/about'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
