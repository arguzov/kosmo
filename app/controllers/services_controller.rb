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
        @service = Service.find(79)
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
     @answers = [
         'Неправда. Только с темным волосом работают на фотоэпиляции. Лазер же удаляет навсегда все типы нежелательных волос — пушок, рыжий, светлый, темный, очень жесткий — любой.',
         'Неправда. Перед лазерной эпиляцией волосы, наоборот, нужно тщательно выбрить. Идеально, чтобы волос не было видно вовсе. Допускается длина до 1-2 мм, а все, что длиннее, уже финансово невыгодно — вам нужно будет больше процедур, чтобы удалить волосы навсегда.',
     'Может оказаться правдой. Чтобы этого не произошло, нужно грамотно выбирать салон и специалиста. Во всех наших салонах мы используем американский лазер последнего поколения, который не вызывает ожогов и раздражения, не оставляет порезов, царапин и вросших волос.',
     'Уже неправда. У тех, кто делал удаление волос лазером несколько лет назад, остались воспоминания о неприятных покалываниях от лазера. У нас процедура безболезненна даже для людей с низким болевым порогом, благодаря лазеру последнего поколения, который охлаждает кожу и снимает любую боль.',
     'Неправда. Лазерная эпиляция — не то же самое, что эпиляция воском или шугарингом, когда сидеть дома действительно приходится. Покраснения после лазерной эпиляции сходят за 10-20 минут. Потом можно сразу наносить макияж (если вы делали эпиляцию на лице) и отправляться на встречу или вечеринку.',
     'Частично правда. Волосы удаляются полностью, но не за один раз, а после курса процедур. Волосы будут исчезать постепенно, становиться светлее и незаметнее, а по завершении цикла перестанут расти окончательно. Чтобы удалить волосы лазером навсегда, достаточно 3-8 процедур, в зависимости от зоны эпиляции.',
     'Неправда. Из года в год нужно делать эпиляцию воском или шугаринг, эффект от которых держится максимум 2-3 недели. В случае с лазерной эпиляцией хватит коррекции не чаще двух раз в год, обычно реже.',
     'Неправда. Это заблуждения связано с еще одним, что лазерную эпиляцию нельзя делать на загорелую кожу. На самом деле можно и то, и другое, и безопасно для здоровья. Самое главное — подготовиться и не загорать за 2 недели до процедуры.',
     'Можно, но не сразу. Загорать мы не рекомендуем только в первые две недели после эпиляции, а потом уже можно. На третьей и четвертой неделях используйте крем от загара с фактором защиты не ниже 30 SPF. Итого — месяц бережного отношения к своей коже.',
     'Неправда, подключаем математику. Посчитаем и сравним, во сколько обойдется в Казани эпиляция лазером и воском популярной области бикини.<br>
         Лазер: курс из 5 процедур стоит 19200.<br>
         Шугаринг. Тут нужна эпиляция каждые 3 недели, в наших центрах по 1110 ₽ каждая. Делать эпиляцию воском нужно регулярно, а значит умножаем на 12 месяцев и получаем расходы по 17760 ₽ в год.<br>
         Итого: 19200 ₽ за полное удаление волос лазером или ежегодно более 17760 ₽ за эпиляцию сахаром, выгода очевидна.',
     'Можно, но бессмысленно. Домашние лазерные эпиляторы подходят тем, у кого есть безграничное терпение и много свободных вечеров. Чтобы никто по неопытности не получил ожог кожи, лазера в домашних эпиляторах установлен очень слабый и маленький. Чтобы проэпилировать каждую ногу, нужно несколько часов (вместо 20 минут в салоне на обе ноги). Людям со светлым волосом или смуглой кожей домашний эпилятор не подойдет вовсе — лазер работает только с очень светлой незагорелой кожей с темным волосом.',
     'Неправда. Современные лазеры работают с любыми участками кожи и легко помогут с удалением волос на спине или груди — самыми популярными зонами у мужчин.'
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
        unless @service.fl_show
            raise ActionController::RoutingError.new('Not Found')
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
        @service.content = @service.content.gsub('<iframe','<iframe width="560" height="315"')
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
