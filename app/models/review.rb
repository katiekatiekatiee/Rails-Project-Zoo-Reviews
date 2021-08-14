class Review < ApplicationRecord
    belongs_to :user 
    belongs_to :zoo 
    validates :title, :content, presence: true
end
