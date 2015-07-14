class Zoo < ActiveRecord::Base
	has_many :animals, dependent: :destroy
	validates :name, :location, presence: true
end


