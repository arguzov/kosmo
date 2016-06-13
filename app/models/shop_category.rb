class ShopCategory < ActiveRecord::Base

    def unit_id
        return self.parent_id
    end
end
