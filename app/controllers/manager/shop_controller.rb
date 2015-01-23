class Manager::ShopController < ShopController
    include ShopHelper
    layout 'manager'
    before_action :authenticate_user!
end
