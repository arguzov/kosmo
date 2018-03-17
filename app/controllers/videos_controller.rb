class VideosController < ApplicationController
    def index
        @videos = Video.order('created_at desc')
    end
end
