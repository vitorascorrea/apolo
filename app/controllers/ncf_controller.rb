class NcfController < ApplicationController
	def new
		@ncf = Ncf.new
	end

	def create
		@ncf = Ncf.new(params.require(:ncf).permit(:atendente_responsavel))
		@ncf.save
		redirect_to @ncf
	end

	def index		
		@todos_ncf = Ncf.all
	end

	def show
		@ncf = Ncf.find(params[:id])
	end

	def edit
	end

	def update		
	end
end