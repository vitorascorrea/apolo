class Chamado < ActiveRecord::Base
	belongs_to :motorista, :class_name => "Motorista", :foreign_key => :motorista_velorio_id
	belongs_to :motorista, :class_name => "Motorista", :foreign_key => :motorista_sepultamento_id
	belongs_to :user

	VALID_PDF_REGEX = /.+\.pdf/i

	validates :ncf, presence: true, format: { with: VALID_PDF_REGEX }
	validates :nota, presence: true
	validate  :ncf_size

	mount_uploader :ncf, PdfUploader

	private

  def ncf_size
    if ncf.size > 0.5.megabytes
      errors.add(:ncf, "deve ser menor que 500 kbytes")
    end
  end
end
