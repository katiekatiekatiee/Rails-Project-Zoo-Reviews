class Review < ApplicationRecord
    belongs_to :user 
    belongs_to :zoo 
    accepts_nested_attributes_for :zoo
end
