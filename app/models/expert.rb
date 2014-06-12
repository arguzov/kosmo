class Expert < ActiveRecord::Base
    has_attached_file :photo, :styles => { :medium => "300x300", :thumb => "100x100" }, :default_url => "/images/:style/missing.png"
    validates_attachment_content_type :photo, :content_type => /\Aimage\/.*\Z/
    has_and_belongs_to_many :services
    accepts_nested_attributes_for :services, allow_destroy: true

    attr_accessor :photo_file_name
    attr_accessor :photo_content_type
    attr_accessor :photo_file_size
    attr_accessor :photo_updated_at
end
