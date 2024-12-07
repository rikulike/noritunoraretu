Rails.application.routes.draw do

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end


  namespace :senior do
    resources :noritu_posts, only:[:new, :show, :edit, :create, :update, :destroy] do
      resource :noritu_favorite, only: [:create, :destroy]
      end
    resources :senior_users, only:[:show, :edit, :update, :destroy]
    resources :young_users, only:[:show]
    get 'homes/about'
    get 'homes/top'
    get 'noritu_favorites/index'
  end

  namespace :young do
   resources :groups, only: [:new, :show, :index, :create, :destroy, :update, :edit] do
     resource :group_young_users, only: [:create, :destroy]
     resources :event_notices, only:[:new, :create]
   end
   resources :group_users, only: [:create, :destroy]
   get 'homes/about'
   get 'homes/top'
   resources :noritu_posts, only: [:index, :show]
  end



  devise_for :admin, skip: [:registrations, :password], controllers: {
    sessions: 'admin/sessions'
  }

  namespace :admin do
    get 'dashboards', to: 'dashboards#index'
    resources :young_users, only: [:destroy, :show]
    resources :wisdom_posts, only: [:destroy]
    resources :wisdom_post_comments, only: [:destroy]
    resources :groups, only: [:index, :destroy]
  end

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

  scope module: :young do
    get "wisdom_posts/:id/wisdom_post_comments", to: "wisdom_posts#show"
    resources :wisdom_posts, only: [:index, :show, :edit, :create, :destroy, :update, :new] do
      resources :wisdom_post_comments, only: [:create, :destroy]
    end
    resources :young_users, only: [:index, :show, :edit, :update, :destroy]
    get '/search', to: 'searches#search'
    resources :senior_users, only: [:show]
  end

  root to: 'homes#top'
  get 'homes/about'

  resources :messages, only: [:create]
  resources :rooms, only: [:show]




  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end



