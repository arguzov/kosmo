class AddFlBannerToPromo < ActiveRecord::Migration
  def change
      add_column :promos, :fl_banner, :boolean
  end
end
