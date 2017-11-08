class Expert < ActiveRecord::Base
    ROLES = {1=>"Врач косметолог",2=>"Врач трихолог",3=>"Специалист по телу",4=>"Мастер по эпиляции",5=>"Мастер ногтевого сервиса",6=>'Администратор'}
    ROLES_PLURAL = {1=>"Врачи косметологи",2=>"Врачи трихологи",3=>"Специалисты по телу",4=>"Мастера по эпиляции",5=>"Мастера ногтевого сервиса",6=>'Администраторы'}
    has_attached_file :photo, :styles => { :medium => "300x300", :thumb => "100x100" }, :default_url => "/images/:style/missing.png"
    validates_attachment_content_type :photo, :content_type => /\Aimage\/.*\Z/
    has_and_belongs_to_many :services
    has_and_belongs_to_many :posts
    accepts_nested_attributes_for :services, allow_destroy: true
    default_scope { where('fl_order > 0') }

    def role
        Expert::ROLES[self.role_id]
    end
end
