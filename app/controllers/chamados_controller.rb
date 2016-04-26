class ChamadosController < ApplicationController
	
	def new
		@chamado = Chamado.new
	end

	def create
		debugger
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
		@motorista = Motorista.find_by(id: @chamado.motorista_velorio_id)
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
		@chamado = Chamado.find(session[:id_chamado])
		@chamado.update_attributes(motorista_velorio_id: params[:id])
		array_status = ['Aguardando alocação de motorista', 'À caminho do falecido', 'À caminho do local de velório', 'Alocando motorista de sepultamento', 'À caminho do local de sepultamento', 'Finalizado']
		index_novo_status = array_status.index(@chamado.status) + 1	
		atualizar_status(@chamado.id, array_status[index_novo_status])
		redirect_to chamados_path
	end

	def troca_status
		array_status = ['Aguardando alocação de motorista', 'À caminho do falecido', 'À caminho do local de velório', 'Alocando motorista de sepultamento', 'À caminho do local de sepultamento', 'Finalizado']
		@chamado = Chamado.find(params[:format])
		index_novo_status = array_status.index(@chamado.status) + 1			

		if @chamado.status == 'Aguardando alocação de motorista' || @chamado.status == 'Alocando motorista de sepultamento'
			session[:id_chamado] = @chamado.id
			redirect_to lista_alocacao_motoristas_path
		else
			if index_novo_status < array_status.length
				if array_status[index_novo_status] == 'Alocando motorista de sepultamento'
					@chamado.update_attributes(motorista_velorio_id: nil)
				end
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
	end

	def atualizar_nota(id, nota)
		@chamado = Chamado.find(id)
		@chamado.update_attributes(nota: nota)	
	end

	def chamado_params
		params.require(:chamado).permit(:nota, :ncf, :data_velorio, :data_sepultamento)
	end
end
