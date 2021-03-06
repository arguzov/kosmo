class Section < ActiveRecord::Base
    has_attached_file :photo, :styles => { :medium => "300x300", :thumb => "100x100" }, :default_url => "/images/:style/missing.png"
    validates_attachment_content_type :photo, :content_type => /\Aimage\/.*\Z/
    has_and_belongs_to_many :services
    accepts_nested_attributes_for :services, allow_destroy: true

    belongs_to :parent_section, class_name: 'Section', :foreign_key => :parent_id, :primary_key => :id
end
