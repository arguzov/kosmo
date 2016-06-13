class Certificate < ActiveRecord::Base
    has_attached_file :photo, :styles => { :medium => "300x300", :thumb => "100x100" }, :default_url => "/images/:style/missing.png"
    validates_attachment_content_type :photo, :content_type => /\Aimage\/.*\Z/
    STATUSES = {"Работает"=>1,"Остановлен"=>2}
    TYPES = {"По номиналу"=>1,"По услугам"=>2}

    has_and_belongs_to_many :services
    scope :by_group, -> (group){where('group_id = ?',group)}

    def status
        Subscription::STATUSES.invert[self.fl_status]
    end

    def type
        Subscription::STATUSES.invert[self.fl_type]
    end
end
