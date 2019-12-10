class Training < ActiveRecord::Base 
  has_many :employtrains
  has_many :employees, through: :employtrains

end