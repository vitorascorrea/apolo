Rails.application.routes.draw do
  
  root 'interfaces#interface_municipe'

  post 'direcionar_chamado' => 'interfaces#direcionar_chamado'

  get 'login'               => 'sessions#new'
  post 'login'              => 'sessions#create'
  delete 'logout'           => 'sessions#destroy'

  get 'atualizar_status' => 'chamados#troca_status'

  get 'associa_motorista'          => 'chamados#associa_motorista'
  get 'lista_alocacao_motoristas'  => 'motoristas#lista_alocacao_motoristas'
  post 'controlador_atualizacao'   => 'chamados#controlador_atualizacao'
  
  resources :ncf
  resources :chamados
  resources :sessions
  resources :motoristas
end
