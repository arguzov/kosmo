class MetrikaController < ApplicationController

    def register
        metrika = Metrika.new
        metrika.service_id = params[:service_id]
        metrika.action_id = params[:action_id]
        metrika.ip = request.remote_ip
        metrika.save
        render :json => {status: 'ok'}
    end

end
