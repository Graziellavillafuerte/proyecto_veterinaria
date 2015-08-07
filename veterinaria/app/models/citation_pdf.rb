class CitationPdf < Prawn::Document
    def initialize(data, view)
      super()
      text "Mensaje. "
      text data
   end
end
