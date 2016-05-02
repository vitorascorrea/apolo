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
		@chamados = Chamado.all
	end

	def update
		@chamado = Chamado.find(params[:id])
		atualizar_nota(params[:id], params[:chamado][:nota])
		redirect_to root_url
	end

	#========================================================================#

	def associa_motorista
		@chamado = Chamado.find(params[:id_chamado])
		if !@chamado.motorista_velorio_id
			@chamado.update_attributes(motorista_velorio_id: params[:id])
		elsif !@chamado.motorista_sepultamento_id
			@chamado.update_attributes(motorista_sepultamento_id: params[:id])
		end
		index_novo_status = array_status.index(@chamado.status) + 1
		atualizar_status(@chamado.id, array_status[index_novo_status])
		Motorista.find(params[:id]).update_attributes(ocupado: true)
		redirect_to chamados_path
	end

	def troca_status
		@chamado = Chamado.find(params[:format])
		index_novo_status = array_status.index(@chamado.status) + 1
		if @chamado.status == 'Aguardando alocação de motorista' || @chamado.status == 'Alocando motorista de sepultamento'
			redirect_to lista_alocacao_motoristas_path(id_chamado: @chamado.id)
		else
			if index_novo_status < array_status.length
				atualizar_status(@chamado.id, array_status[index_novo_status])
			end
			redirect_to chamados_path
		end
	end

	#========================================================================#

	private

		def atualizar_status(id, status)
			@chamado = Chamado.find(id)
			@chamado.update_attributes(status: status, tempo_prox_status: Time.now.in_time_zone + 30.minutes)
			if status == 'Alocando motorista de sepultamento'
				Motorista.find(@chamado.motorista_velorio_id).update_attributes(ocupado: false)
			elsif status == 'Finalizado'
				Motorista.find(@chamado.motorista_sepultamento_id).update_attributes(ocupado: false)
			end
		end

		def atualizar_nota(id, nota)
			@chamado = Chamado.find(id)
			@chamado.update_attributes(nota: nota)
		end

		def chamado_params
			params.require(:chamado).permit(:nota, :ncf, :data_velorio, :data_sepultamento)
		end

		def array_status
			['Aguardando alocação de motorista', 'À caminho do falecido', 'À caminho do local de velório', 'Alocando motorista de sepultamento', 'À caminho do local de sepultamento', 'Finalizado']
		end
end
