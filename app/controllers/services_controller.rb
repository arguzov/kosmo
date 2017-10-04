class ServicesController < ApplicationController
    before_action :find_service, only: [:show]
    before_action :define_experts, only: [:show]
    before_action :define_issues, only: [:show]
    layout :resolve_layout

    def index
        if params.has_key?(:q)
            services = Service.where('name like ?','%'+params[:q]+'%')
            if (services.length == 1)
                return redirect_to service_path(url: services.first.url,id: services.first.id)
            end
        end
        @sections = Section.order('fl_order')
    end

    def lazer
     @myths = [
        'Удалить можно только темные волосы',
        'Волосы перед процедурой нужно долго отращивать',
            'Лазерная эпиляция оставляет ожоги',
            'Это очень больно — больнее, чем воском',
            'После эпиляции нужно неделю сидеть дома',
            'Удалить волосы можно один раз и навсегда',
            'Лазерную эпиляцию нужно делать всю жизнь',
            'Эпиляцию нельзя делать летом',
            'После лазерной эпиляции нельзя загорать',
            'Это дорого',
            'Лазерную эпиляцию можно сделать дома',
            'Мужчинам лазерная эпиляция не поможет'
        ]
    end

    def show
        unless browser.bot?
            metrika = Metrika.new
            metrika.service_id = @service.id
            metrika.action_id = 1
            metrika.ip = request.remote_ip
            metrika.save
        end
        #@pricelist = @service.pricelist.split(/\n/)
        @pricelist = ''
        @children = Service.where('parent_id = ? AND fl_publish = 1',@service.id)
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
        expert_id = @service.content.scan(/<blockquote[^>]*id="([0-9]+)"[^>]*>/i)
        if expert_id[0] && expert_id[0][0]
            expert = Expert.find(expert_id[0][0])
            unless expert == nil
                @service.content = @service.content.gsub('<blockquote id="' + expert_id[0][0] + '">','<blockquote id="' + expert_id[0][0] + '">' + '<div class="pull-left" style="height:100px;overflow-y:hidden;margin-right:10px;"><img style="width:100px;" src="http://kosmetologiya-kazan.ru'+expert.photo.url(:medium)+'"></div>')
                @service.content = @service.content.gsub('</blockquote>','<div style="clear:both;"></div></blockquote>')
            end
        end
        @album = Dir.glob("public/data/services/#{@service.id}/th/*")
        if @service.complements != nil
            @complements = Service.where('id IN (?) AND fl_publish = 1',@service.complements.split(','))
        else
            @complements = nil
        end
    end

    def prices
      @services = Service.where('parent_id = 0 AND fl_publish = 1')
    end

    private
    def find_service
        @service = Service.find(params[:id])
    end
    def define_experts
        @experts = @service.experts
        if @experts.count < 1 && @service.parent_id > 0
            @experts = Service.where('parent_id = ?',@service.parent_id).first.experts
        end
        if @experts.nil? or @experts.count < 1
            @experts = Expert.limit(4)
        end
    end

    def define_issues
        if @service.parent_id > 0
            @issues = Service.where('parent_id = ?',@service.parent_id).first.issues.where('NOT (parent_id = 50)')
        else
            @issues = @service.issues.where('NOT (parent_id = 50)')
        end
    end

    private
    def resolve_layout
        case action_name
            when "lazer"
                "wide"
            else
                "application"
        end
    end
end
