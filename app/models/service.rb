class Service < ActiveRecord::Base
    has_attached_file :photo, :styles => { :medium => "300x300", :thumb => "100x100" }, :default_url => "/images/:style/missing.png"
    validates_attachment_content_type :photo, :content_type => /\Aimage\/.*\Z/
    has_many :medicaments
    has_and_belongs_to_many :issues
    has_and_belongs_to_many :experts
    has_and_belongs_to_many :promos
    accepts_nested_attributes_for :issues, allow_destroy: true
    accepts_nested_attributes_for :experts, allow_destroy: true
    accepts_nested_attributes_for :promos, allow_destroy: true

    def self.for_select
        self.where('parent_id = 0').map{|c| ["#{c.name}", c.id]}.unshift(["Выбрать",0])
    end
end
