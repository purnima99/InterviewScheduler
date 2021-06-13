Rails.application.routes.draw do
  devise_for :users
  resources :interview_schedules
  root 'interview_schedules#welcome'
  get '/uploads/:filename', to: redirect('/uploads/%{filename}', status: 302)
  get 'interview_schedule/:id/:email', to: 'interview_schedules#show'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
