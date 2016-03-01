class CertificatesController < ApplicationController

    def index
        @certificates = Certificate.all
    end

    def group
        @group = Certificate.find(params[:group])
        @certificates = Certificate.by_group(params[:group])
    end

    def show
        @certificate = Certificate.find(params[:id])
    end

end
