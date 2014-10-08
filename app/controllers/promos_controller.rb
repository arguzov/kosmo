class PromosController < ApplicationController
    def index
        @promos = Promo.all
    end

    def show
        @promo = Promo.find(params[:id])
        @promos = Promo.where('fl_active = 1 AND NOT (id = ?)',@promo.id).limit(2)
    end
end
