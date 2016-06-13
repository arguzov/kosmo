class Subscription < ActiveRecord::Base
    has_attached_file :photo, :styles => { :medium => "300x300", :thumb => "100x100" }, :default_url => "/images/:style/missing.png"
    validates_attachment_content_type :photo, :content_type => /\Aimage\/.*\Z/
    belongs_to :service
    belongs_to :post
    STATUSES = {"Неизвестно"=>0,"Работает"=>1,"Остановлен"=>2}

    def status
        Subscription::STATUSES.invert[self.fl_status]
    end
end
