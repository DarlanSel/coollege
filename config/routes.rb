Rails.application.routes.draw do
  root to: 'welcome#index'

  devise_for :users

end
