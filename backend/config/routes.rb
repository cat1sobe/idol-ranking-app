Rails.application.routes.draw do
  resources :idols
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  namespace Api:
   namespace V1:
    get :health_check, to: 'health_check#index'
end
