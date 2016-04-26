class InterfacesController < ApplicationController
	def direcionar_chamado
		@chamado = Chamado.find_by(nota: params[:ncf])
		if @chamado
			redirect_to @chamado, nota: params[:ncf]
		else
			flash[:danger] = "Não foi encontrada nenhuma NCF com essa identificação"
			render 'interfaces/interface_municipe'
		end
	end
end
