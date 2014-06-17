class ServicesController < ApplicationController
    before_action :find_service, only: [:show]
    before_action :define_experts, only: [:show]
    before_action :define_issues, only: [:show]
    def show
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
        @album = Dir.glob("public/data/services/#{@service.id}/th/*")
    end

    def prices
      @services = Service.where('parent_id = 0')
    end

    private
    def find_service
        @service = Service.find(params[:id])
    end
    def define_experts
        if @service.parent_id > 0
            @experts = Service.where('parent_id = ?',@service.parent_id).first.experts.limit(2)
        else
            @experts = @service.experts.limit(2)
        end
        if @experts.nil? or @experts.count < 1
            @experts = Expert.limit(2)
        end
    end

    def define_issues
        if @service.parent_id > 0
            @issues = Service.where('parent_id = ?',@service.parent_id).first.issues.where('NOT (parent_id = 50)')
        else
            @issues = @service.issues.where('NOT (parent_id = 50)')
        end
    end
end
