Rails.application.routes.draw do
  root to: 'welcome#index'

  devise_for :users

  resources :schools do
    get 'homepage', to: 'schools#homepage', as: :homepage
    resources :teachers
    resources :students, except: %i[ show ]

    resources :grades, except: %i[ show ]
  end
end
