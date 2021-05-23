Rails.application.routes.draw do
  root to: 'welcome#index'

  devise_for :users

  resources :schools do
    get 'homepage', to: 'schools#homepage', as: :homepage
    resources :teachers
  end
end
