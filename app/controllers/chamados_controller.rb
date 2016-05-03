class ChamadosController < ApplicationController
  before_action :logged_in_user, only: [:new, :create, :index, :update, :associa_motorista, :troca_status]

	def new
		@chamado = Chamado.new
	end

	def create
		@chamado = Chamado.new(chamado_params)
		if @chamado.save
			@chamado.update_attributes(status: "Aguardando alocação de motorista", tempo_prox_status: Time.now.in_time_zone + 30.minutes)
      redirect_to chamados_path
    else
    	render 'new'
		end
	end

	def show
		@chamado = Chamado.find(params[:id])
		gon.horario = @chamado.tempo_prox_status
		gon.status = params[:status]
    if @chamado.motorista_velorio_id.nil?
		  @motorista = Motorista.find_by(id: @chamado.motorista_velorio_id)
    else
      @motorista = Motorista.find_by(id: @chamado.motorista_sepultamento_id)
    end
	end

	def index
		@chamados = Chamado.where('status != "Finalizado"')
	end

  def altera_status
    status_atual = params[:status_atual]
    prox_status = params[:prox_status]
    @chamado = Chamado.find(params[:id_chamado])

    if prox_status == 'Aguardando alocação de motorista para o sepultamento'
      @chamado.update_attributes(motorista_velorio_id: nil)
    end

    if status_atual == 'Aguardando alocação de motorista' || status_atual == 'Aguardando alocação de motorista para o sepultamento'
      @chamado.update_attributes(status: prox_status)
      redirect_to lista_alocacao_motoristas_path(id_chamado: @chamado.id)
    else
      @chamado.update_attributes(status: prox_status)
      redirect_to chamados_path
    end
  end

  def associa_motorista
    @chamado = Chamado.find(params[:id_chamado])
    @motorista = Motorista.find(params[:id_motorista])
    if @chamado.motorista_velorio_id.nil?
      @chamado.update_attributes(motorista_velorio_id: @motorista.id)
    else
      @chamado.update_attributes(motorista_sepultamento_id: @motorista.id)
    end
    @motorista.update_attributes(ocupado: true)
    redirect_to chamados_path
  end

	private

  def chamado_params
    params.require(:chamado).permit(:nota, :ncf, :data_velorio, :data_sepultamento)
  end

	def array_status
		['Aguardando alocação de motorista', 'Buscando material', 'Buscando falecido', 'A caminho do local de sepultamento', 'A caminho do local de velório', 'Aguardando alocação de motorista para o sepultamento', 'Finalizado', 'Motorista alocado, aguardando instrucao', 'Motorista de sepultamento alocado, aguardando instrucao']
	end

	def matriz_de_adjacencia
		[
				[0,0,0,0,0,0,0,1,0], # Aguardando alocação de motorista
				[0,0,1,0,0,0,0,0,0], # Buscar material
				[0,0,0,1,1,0,0,0,0], # Buscar falecido
				[0,0,0,0,0,0,1,0,0], # A caminho do local de sepultamento
				[0,0,0,0,0,1,1,0,0], # A caminho do local de velório
				[0,0,0,0,0,0,0,0,1], # Aguardando alocação de motorista para o sepultamento
				[0,0,0,0,0,0,0,0,0], # Finalizado
        [0,1,1,0,0,0,0,0,0], # Motorista alocado, aguardando instrucao
        [0,0,0,1,0,0,0,0,0]  # Motorista do sepultamento alocado, aguardando instrucao
		]
	end

	def proximos_status(status)
		indice = array_status.index(status)
		array = []
		matriz_de_adjacencia[indice].each_with_index do |val,index|
			if val == 1
				array << array_status[index]
			end
		end
		return array
	end
  helper_method :proximos_status
end
