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
            ids = [12,13,14,21,19,20]
        elsif params[:id].to_i == 3
            @title = 'Абонементы на массаж и коррекцию фигуры'
            ids = [11]
        elsif params[:id].to_i == 4
            @title = 'Абонементы на ногтевой сервис'
            ids = [15]
        end
        @subscriptions = Subscription.where('id IN (?)',ids).order("FIELD(id,'#{ids.join(',').to_s}')")
    end

    def show
        @subscriptions = Subscription.find(params[:id])
    end

    def send_mail
        @user = User.find(params[:user_id])
        SubscribeMailer.letter({template_id: 1,user_name: @user.name,user_email: @user.email}).deliver
        render json: {status: 'ok'}
    end

end
