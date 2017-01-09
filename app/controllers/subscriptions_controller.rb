class SubscriptionsController < ApplicationController

    def index
        @subscriptions = Subscription.all
    end

    def section
        if params[:id].to_i == 1
            @title = 'Абонементы на эпиляцию'
            ids = [1,16,17,18]
        elsif params[:id].to_i == 2
            @title = 'Абонементы на косметологические услуги'
            ids = [12,13,14,19]
        elsif params[:id].to_i == 3
            @title = 'Абонементы на массаж и коррекцию фигуры'
            ids = [11]
        elsif params[:id].to_i == 4
            @title = 'Абонементы на ногтевой сервис'
            ids = [15]
        end
        @subscriptions = Subscription.where('id IN (?)',ids)
    end

    def show
        @subscriptions = Subscription.find(params[:id])
    end

end
