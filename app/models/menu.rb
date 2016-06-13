class Menu < ActiveRecord::Base
    TYPES = {"Главное"=>1,"Боковое"=>2}
    belongs_to :post
    belongs_to :category

    def actual_url
        if self.post_id.to_i > 0
            self.post.url
        elsif self.category_id.to_i > 0
            self.category.url
        else
          self.url
        end
    end
end
