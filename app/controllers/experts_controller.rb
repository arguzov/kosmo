class ExpertsController < ApplicationController
    def show
      @expert = Expert.find(params[:id])
      @diplomas = Dir.glob("public/data/experts/#{@expert.id}/diploma/th/*")
      @gallery = Dir.glob("public/data/experts/#{@expert.id}/photos/th/*")
      @reviews = @expert.posts.where('category_id = 31').limit(3)
    end

    def index
        i = 1
        @experts = {}
        while i < 8
            @experts[i] = Expert.where('role_id = ?', i).order('fl_order,id')
            i += 1
        end
    end
end
