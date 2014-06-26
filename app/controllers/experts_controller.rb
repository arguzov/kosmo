class ExpertsController < ApplicationController
    def show
      @expert = Expert.find(params[:id])
      @diplomas = Dir.glob("public/data/experts/#{@expert.id}/diploma/th/*")
      @gallery = Dir.glob("public/data/experts/#{@expert.id}/photos/th/*")
    end

    def index
        @experts = Expert.order('fl_order,id')
    end
end
