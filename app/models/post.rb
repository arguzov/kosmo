class Post < ActiveRecord::Base
    has_attached_file :photo, :styles => { :medium => "300x300", :thumb => "100x100" }, :default_url => "/images/:style/missing.png"
    validates_attachment_content_type :photo, :content_type => /\Aimage\/.*\Z/
    STATUSES = {"Опубликован"=>1,"Скрыт"=>2,"Черновик"=>3}
    belongs_to :category
    belongs_to :user
    has_and_belongs_to_many :experts
    has_and_belongs_to_many :services

    def category_name
        if self.category
          self.category.name
        else
          ''
        end
    end
end
