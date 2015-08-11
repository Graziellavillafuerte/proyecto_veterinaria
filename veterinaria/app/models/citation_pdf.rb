class CitationPdf < Prawn::Document
    def initialize(citation, view)
        super()
        stroke do
           move_down 25
           text "DATOS DE LA CITA"
           horizontal_rule
        end
        stroke do
            move_down 30
            text "Estimado(a) Sr(a).: " + citation.client_name + " " + citation.client_firstlastname + " " + citation.client_secondlastname

            move_down 10
            text "Se le ha programado la siguiente cita:"

            move_down 10
            text "Fecha de Cita: " + citation.date.to_s
            text "Hora de Cita: " + citation.time.strftime('%H:%M')
        end
        move_down 10
        text "Información de los servicios:"
        
        move_down 20
        
        @citation_details = CitationDetail.where(:citation_id => citation.id)
        
        if @citation_details.count > 0
            text_box "CANTIDAD", :at => [25, 535], :width => 75, :align => :center
            text_box "NOMBRE", :at => [105, 535], :width => 225, :align => :center
            text_box "OBSERVACIÓN", :at => [335, 535], :width => 200, :align => :center
            @indice = 515
            @citation_details.each do |citation_detail|
                stroke do
                    text_box citation_detail.quantity.to_s, :at => [25, @indice], :width => 75, :align => :center 
                    text_box citation_detail.service_name, :at => [105, @indice], :width => 225
                    text_box citation_detail.service_observation, :at => [335, @indice], :width => 200
                    @indice = @indice - 15
                end
            end
        end
   end
end