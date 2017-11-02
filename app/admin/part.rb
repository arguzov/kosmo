ActiveAdmin.register Part do
    menu :if => proc{ current_user.id < 5 }, label: "Части тела"

  permit_params :name, shop_product_ids: []
  #fdddsf
  index do
      column :name
      actions
  end

  form do |f|
      f.inputs "Часть тела" do
          f.input :name, :label=>'Название'
      end
      f.inputs "Продукты" do
          f.input :shop_products, as: :check_boxes
      end
      f.actions
  end
end
