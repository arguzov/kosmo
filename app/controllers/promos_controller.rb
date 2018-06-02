class PromosController < ApplicationController
    layout 'banner'
    def index
        @promos = Promo.where('fl_active = 1 AND fl_menu = 1').order('fl_order ASC')
    end

    def show
        @promo = Promo.find(params[:id])
        @promos = Promo.where('fl_active = 1 AND NOT (id = ?)',@promo.id).order('fl_order ASC').limit(3)
    end

    def top_banner

    end
end
