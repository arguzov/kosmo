class IssuesController < ApplicationController
    def show
        @issue = Issue.find_by_url(params[:url])
        @services = @issue.services.where('fl_publish = 1')
    end
end
