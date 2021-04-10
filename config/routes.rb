Rails.application.routes.draw do
  root to: 'root#show'
  get 'number', to: 'number#show'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
