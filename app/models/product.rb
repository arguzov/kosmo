class Product < ActiveRecord::Base
    has_attached_file :photo, :styles => { :thumb => "180x180" }, :default_url => "/images/:style/missing.jpg"
    validates_attachment_content_type :photo, :content_type => /\Aimage\/.*\Z/
    belongs_to :collection
    has_many :items
    default_scope {where('fl_show = 1')}
end
