class Manager::Shop::CategoriesController < Manager::ShopController
    before_action :get_category, only: [:edit,:update]
    def index

    end

    def get_category
        @category = ShopCategory.find(params[:id])
    end

    def category_params
        params.require(:shop_category).permit(:name, :url, :fl_show, :description, :parent_id)
    end
end
