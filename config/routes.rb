Rails.application.routes.draw do
  resources :examples, except: [:new, :edit]
end
