class Promo < ActiveRecord::Base
  has_attached_file :photo, :styles => { :medium => "300x300", :thumb => "100x100" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :photo, :content_type => /\Aimage\/.*\Z/
  has_and_belongs_to_many :services
  has_many :widgets, primary_key: :id, foreign_key: :entity_id
  accepts_nested_attributes_for :services, allow_destroy: true
  #default_scope where('due > ?',Date.today)

  def is_alive
      self.due > Time.now
  end
end
