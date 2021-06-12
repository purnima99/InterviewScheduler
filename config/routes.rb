Rails.application.routes.draw do
  devise_for :users
  resources :interview_schedules
  root 'interview_schedules#welcome'
  get '/uploads/:filename', to: redirect('/uploads/%{filename}', status: 302)
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
