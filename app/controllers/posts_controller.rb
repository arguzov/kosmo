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
        @more = Post.where('category_id = ? AND fl_status = 1 AND NOT(id = ?)',@post.category_id,@post.id).limit(4).order('id DESC')
    end

    def gallery
        @album = Dir.glob("public/data/gallery/th/*")
    end

    def reviews
        if !params.has_key?('sort') || params[:sort] == 'asc'
            order = ' created_at ASC '
        else
            order = ' created_at DESC'
        end
        @reviews = Post.where('category_id = 31').order(order).paginate(:page => params[:page], :per_page => 10)
    end

    def news
        @news = Post.where('category_id = 1 AND fl_status = 1').order('id DESC')
    end

    def contacts

    end

    def thanks

    end
end
