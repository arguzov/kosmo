class ShopCategory < ActiveRecord::Base

    belongs_to :parent_category, class_name: 'ShopCategory', :foreign_key => :parent_id, :primary_key => :id

    def unit_id
        return self.parent_id
    end
end
