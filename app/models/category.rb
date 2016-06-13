class Category < ActiveRecord::Base
    STATUSES = {"Опубликован"=>1,"Скрыт"=>2,"Черновик"=>3}
    has_many :posts
end
