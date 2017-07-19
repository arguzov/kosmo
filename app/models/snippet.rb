class Snippet < ActiveRecord::Base
    belongs_to :service
    belongs_to :block
end
