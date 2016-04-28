class Motorista < ActiveRecord::Base
	has_many :chamados
	
	VALID_FOTO_REGEX = /.+\.(jpg|jpeg|gif|png)/i

	validates :nome, presence: true
	validates :foto, allow_blank: true, format: { with: VALID_FOTO_REGEX }
	validate  :tamanho_foto
	
	mount_uploader :foto, FotoUploader

  private

    def tamanho_foto
      if foto.size > 1.megabytes
        errors.add(:picture, "deve ser menor que 1 MB")
      end
    end
end
