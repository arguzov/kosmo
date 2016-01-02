class SubscriptionsController < ApplicationController

    def index
        @subscriptions = Subscription.all
    end

    def show
        @subscriptions = Subscription.find(params[:id])
    end

end
