Rails.application.routes.draw do
  root to: 'pages#home'
  post 'form_target', to: 'pages#form_target'
end
