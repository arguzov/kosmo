class Manager::Shop::CategoriesController < Manager::ShopController
    before_action :get_category, only: [:edit,:update]
    def index

    end

    def new
        @category = ShopCategory.new
    end

    def create
        @category = ShopCategory.create(category_params)
        redirect_to  edit_manager_shop_category_path(@category)
    end

    def update
        if @category.update(category_params)
            redirect_to :back
        else
            render json: @category.errors
        end
    end

    def destroy
        ShopCategory.find(params[:id]).destroy
        redirect_to manager_shop_categories_path
    end

    def get_category
        @category = ShopCategory.find(params[:id])
    end

    def category_params
        params.require(:shop_category).permit(:name, :url, :fl_show, :description, :parent_id)
    end
end
