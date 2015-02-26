class PromosController < ApplicationController
    def index
        @promos = Promo.where('fl_active = 1 AND fl_banner = 0')
    end

    def show
        @promo = Promo.find(params[:id])
        @promos = Promo.where('fl_active = 1 AND NOT (id = ?)',@promo.id).limit(3)
    end
end
