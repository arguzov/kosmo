class Photo < ActiveRecord::Base
    has_attached_file :img, :styles => { :medium => "300x300", :thumb => "100x100" }, :default_url => "/images/:style/missing.png"
    validates_attachment_content_type :img, :content_type => /\Aimage\/.*\Z/
    TYPES = {"До"=>1,"После"=>2}
    belongs_to :service

    def type
        Photo::TYPES.invert[self.photo_type]
    end
end
