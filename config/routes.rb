Rails.application.routes.draw do
  resources :interview_schedules
  root 'interview_schedules#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
