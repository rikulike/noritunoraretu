Rails.application.routes.draw do


  devise_for :young_users, controllers:{
    confirmations: 'young/confirmations',
    passwords:  'young/passwords',
    registrations: 'young/registrations',
    sessions: 'young/sessions',
    unlocks: 'young/unlocks'
     }

  devise_for :senior_users, controllers:{
    confirmations: 'senior/confirmations',
    passwords:  'senior/passwords',
    registrations: 'senior/registrations',
    sessions: 'senior/sessions',
    unlocks: 'senior/unlocks'
  }

   devise_scope :young_user do
    post "young_users/guest_sign_in", to: "young/sessions#guest_sign_in"
  end

  devise_for :admin, skip: [:registrations, :password], controllers: {
    sessions: 'admin/sessions'
  }



  root to: 'homes#top'
  get 'homes/about'
  
  
  
  namespace :young do
   resources :groups, only: [:new, :show, :index, :create, :destroy, :update, :edit] do
     resource :group_young_users, only: [:create, :destroy]
     resources :event_notices, only:[:new, :create]
   end
   resources :group_users, only: [:create, :destroy]
   get 'homes/about'
  end

  scope module: :young do
    get "wisdom_posts/:id/wisdom_post_comments", to: "wisdom_posts#show"
    resources :wisdom_posts, only: [:index, :show, :edit, :create, :destroy, :update, :new] do
      resources :wisdom_post_comments, only: [:create, :destroy]
    end
    resources :young_users, only: [:index, :show, :edit, :update, :destroy]
    get '/search', to: 'searches#search'
  end



  namespace :senior do
    get 'homes/about'
    resources :notiru_posts, only:[:new, :show, :index, :edit, :create]
    resources :senior_users, only:[:show, :edit]
  end


  namespace :admin do
    get 'dashboards', to: 'dashboards#index'
    resources :young_users, only: [:destroy, :show]
    resources :wisdom_posts, only: [:destroy]
    resources :wisdom_post_comments, only: [:destroy]
    resources :groups, only: [:index, :destroy]
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end



