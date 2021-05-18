Rails.application.routes.draw do
  root to: 'welcome#index'

  devise_for :users

  resources :schools

  get ':slug', to: 'schools#homepage', as: :homepage_school
end
