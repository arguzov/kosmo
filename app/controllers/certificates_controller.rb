class CertificatesController < ApplicationController

    def index
        @certificates = Certificate.where('group_id = 0')
    end

    def set
        @group = Certificate.find(1)
        @certificates = Certificate.by_group(1)
    end

    def sum
    end

    def group
        @group = Certificate.find(params[:group])
        @certificates = Certificate.by_group(params[:group])
    end

    def service
        @sections = Section.all
    end

    def show
        @certificate = Certificate.find(params[:id])
    end

end
