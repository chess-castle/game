Rails.application.routes.draw do
  devise_for :users
  root 'ctest#index'
  
  get 'input_PointA_PointB' => 'check_obstruction_cases#input_PointA_PointB' 
  post 'is_obstruction' => 'check_obstruction_cases#is_obstruction'

  resources :check_obstruction_cases_controller
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
