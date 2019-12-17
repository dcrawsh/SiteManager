class Site < ActiveRecord::Base
    belongs_to :user
    has_many :employees
    validates :siteid, uniqueness: true 
end 