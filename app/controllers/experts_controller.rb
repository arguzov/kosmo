class ExpertsController < ApplicationController
    def show
      @expert = Expert.find(params[:id])
      @diplomas = Dir.glob("public/data/experts/#{@expert.id}/diploma/*")
      @gallery = Dir.glob("public/data/experts/#{@expert.id}/photos/*")
    end

    def index
        @experts = Expert.all
    end
end
