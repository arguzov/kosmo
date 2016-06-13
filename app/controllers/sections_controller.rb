class SectionsController < ApplicationController

    def show
        @section = Section.where({:url=>params[:url]}).first
        @prices = Price.select('MIN(price - ((price*discount)/100)) AS min_price,discount,price,service_id').where('price > 0').group('service_id').index_by(&:service_id)
    end

end
