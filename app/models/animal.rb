class Animal < ActiveRecord::Base
	belongs_to :zoo
	validates :name, :species, presence: true
	#can you validate zoo id? 
	
end
