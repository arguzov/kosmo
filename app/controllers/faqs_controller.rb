class FaqsController < ApplicationController

    def index
        @fetch = Faq.where('fl_show = 1 AND service_id is NULL').order('created_at DESC')
    end

    def show
        @faq = Faq.find(params[:id])
    end

    def create
        @faq = Faq.new(faq_params)
        respond_to do |format|
            if @faq.save
                format.html { redirect_to :back, notice: 'Order was created' }
                format.json { render json: @order }
            else
                format.html { render action: 'new' }
                format.json { render json: @order.errors, status: :unprocessable_entity }
            end
        end
    end

    private

    def faq_params
        params.require(:faq).permit(:question, :answer, :fl_show, :author)
    end

end
