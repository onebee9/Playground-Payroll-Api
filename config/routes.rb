Rails.application.routes.draw do
  resources :time_reports, only: [:create]
  resources :employee_reports, only: [:index]
end
