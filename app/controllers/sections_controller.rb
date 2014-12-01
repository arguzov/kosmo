class SectionsController < ApplicationController

    def show
        @section = Section.where({:url=>params[:url]}).first
    end

end
