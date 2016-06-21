ActiveAdmin.register ShopProductItem do
    menu label: "Товары цены"

    permit_params :product_id, :volume, :price, :color, :unit

    index do
        column :shop_product
        column :volume
        column :price
        column :color
        column :unit
        actions
    end

    form do |f|
        f.inputs "Продукт" do
            f.input :shop_product, :label => 'Продукт', :as => :select, :collection => ShopProduct.all.map{|c| ["#{c.name}", c.id]}
            f.input :volume
            f.input :price
            f.input :color
            f.input :unit
        end
        f.actions
    end
  
end
