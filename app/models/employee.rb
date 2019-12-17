class Employee < ActiveRecord::Base 
    belongs_to :site
    has_many :employtrains
    has_many :trainings, through: :employtrains
    validates :workdayid, uniqueness: true 
end