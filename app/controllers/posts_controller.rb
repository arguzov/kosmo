class PostsController < ApplicationController
    def root
        #self.class.layout 'main'
        @news = Post.where('category_id = 1 AND fl_status = 1').order('id desc').limit(4)
        @experts = Expert.order('fl_order,id').limit(5)
        @saloon = Dir.glob("public/data/saloon/*")
        @reviews = Post.where('id IN (145,143)')
        render 'root', :layout=>'main'
    end

    def show
        @post = Post.find(params[:id])
        @more = Post.where('category_id = ? AND fl_status = 1 AND NOT(id = ?)',@post.category_id,@post.id).limit(3).order('id DESC')
    end

    def gallery
        if params.has_key?(:album_id) && params[:album_id].to_i == 2
            @album = Dir.glob("public/data/gallery2/th/*")
            @title = ' на Ибрагимова'
        else
            @album = Dir.glob("public/data/gallery/th/*")
            @title = ' на Спартаковской'
        end
    end

    def reviews
        if !params.has_key?('sort') || params[:sort] == 'desc'
            order = ' created_at DESC '
        else
            order = ' created_at ASC'
        end
        if params.has_key?('service_id')
            @service = Service.find(params[:service_id])
            ids = PostsService.where('service_id = ?',params[:service_id]).pluck(:post_id)
            @reviews = Post.where('id IN (?)',ids).order(order).paginate(:page => params[:page], :per_page => 10)
        else
            @reviews = Post.where('category_id = 31').order(order).paginate(:page => params[:page], :per_page => 10)
        end
    end

    def news
        @news = Post.where('category_id = 1 AND fl_status = 1').order('id DESC')
    end

    def contacts

    end

    def thanks

    end
end
