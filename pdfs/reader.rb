require 'rubygems'
require 'pdf-reader'

File.open("XSFM_OM_NOTA_CONTRATACAO_5798471_1.PDF", "rb") do |io|
  reader = PDF::Reader.new(io)
  body = ""

  reader.pages.each do |page|
	  body = page.text
	end

	puts body

end

