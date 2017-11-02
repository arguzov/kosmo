ActiveAdmin.register Brand do
    menu :if => proc{ current_user.id < 5 }, label: "Бренды"

  permit_params :name, shop_product_ids: []
  #fdddsf
  index do
      column :name
      actions
  end

  form do |f|
      f.inputs "Бренд" do
          f.input :name, :label=>'Название'
      end
      f.actions
  end
end
