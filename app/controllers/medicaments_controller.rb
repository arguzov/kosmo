class MedicamentsController < ApplicationController
    def show
        @medicament = Medicament.find(params[:id])
        @same = Medicament.where('service_id = ?',@medicament.service_id)
        @pricelist = @medicament.service.pricelist.split(/\n/)
    end
end
