class Filial < ActiveRecord::Base
    has_and_belongs_to_many :services

    def name
        self.address
    end
end
