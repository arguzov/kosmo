class ServicesController < ApplicationController
    def show
        @service = Service.find(params[:id])
        @pricelist = @service.pricelist.split(/\n/)
        @children = Service.where('parent_id = ?',@service.id)
        if @service.medicaments
            horizontal = render_to_string(:partial => 'medicaments/window/horizontal', :layout => false, :locals => {:medicaments => @service.medicaments})
            vertical = render_to_string(:partial => 'medicaments/window/vertical', :layout => false, :locals => {:medicaments => @service.medicaments})
            @service.content = @service.content.gsub('{medicaments}',vertical)
            @service.content = @service.content.gsub('{medicaments:horizontal}',horizontal)
            @service.content = @service.content.gsub('{medicaments:vertical}',vertical)
        end
        if @children
            horizontal = render_to_string(:partial => 'services/window/horizontal', :layout => false, :locals => {:services => @children})
            vertical = render_to_string(:partial => 'services/window/vertical', :layout => false, :locals => {:services => @children})
            @service.content = @service.content.gsub('{children}',vertical)
            @service.content = @service.content.gsub('{children:horizontal}',horizontal)
            @service.content = @service.content.gsub('{children:vertical}',vertical)
        end
    end

    def prices
      @services = Service.where('parent_id = 0')
    end
end
