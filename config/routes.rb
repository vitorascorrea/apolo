Rails.application.routes.draw do
  
  root 'interfaces#interface_municipe'

  post 'direcionar_chamado' => 'interfaces#direcionar_chamado'

  get 'login'               => 'sessions#new'
  post 'login'              => 'sessions#create'
  delete 'logout'           => 'sessions#destroy'
  
  resources :ncf
  resources :chamados
  resources :sessions
end
