Rails.application.routes.draw do
  get 'verify/index'

  root to: 'verify#index'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
