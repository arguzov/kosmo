class PromosController < ApplicationController
    def index
        @promos = Promo.where('fl_top = 1 and fl_active = 1').order('fl_order ASC')
    end

    def show
        @promo = Promo.find(params[:id])
        @promos = Promo.where('fl_active = 1 AND NOT (id = ?)',@promo.id).order('fl_order ASC').limit(3)
    end
end
