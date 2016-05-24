class SectionsController < ApplicationController

    def show
        @section = Section.where({:url=>params[:url]}).first
        @prices = Price.select('(price - (MIN(price)*discount)/100) as min_price,price,service_id').where('parent_id > 0').group('service_id').index_by(&:service_id)
    end

end
