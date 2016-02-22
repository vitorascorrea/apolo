Rails.application.routes.draw do
  root 'interfaces#interface_municipe'
  post 'direcionar_chamado' => 'interfaces#direcionar_chamado'
  resources :ncf
end
