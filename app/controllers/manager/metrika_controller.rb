class Manager::MetrikaController < ApplicationController
    layout 'manager'
    before_action :authenticate_user!

    def index
        tmp = Metrika.select('service_id,action_id, COUNT(id) AS cnt')
        if (params.has_key?(:start))
            tmp = tmp.where('created_at > ?',params[:start])
        end
        if (params.has_key?(:end))
            tmp = tmp.where('created_at < ?',params[:end])
        end
        tmp = tmp.group(:service_id).group(:action_id)
        @data = {}
        tmp.each do |row|
            unless (@data.has_key?(row.service_id))
                @data[row.service_id] = {}
            end
            @data[row.service_id][row.action_id] = row.cnt
        end
    end

    def service
        @service_id = params[:service_id]
    end

end
