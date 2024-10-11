Rails.application.routes.draw do
  get 'wisdom_posts/new'
  get 'wisdom_posts/index'
  get 'wisdom_posts/show'
  get 'young_users/show'
  get 'young_users/edit'
  get 'homes/top'
  get 'homes/about'
  devise_for :young_users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
