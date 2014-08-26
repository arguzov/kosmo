class PrivateController < ApplicationController
    layout 'private'

    def profile
        @user = current_user
    end

end
