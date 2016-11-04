class Movie < ActiveRecord::Base
  attr_accessible :title, :rating, :description, :release_date
	def self.all_ratings
		return ['G', 'PG', 'PG-13', 'R', 'NC-17']
	end
	def self.selected_ratings
		return ['G', 'PG', 'PG-13', 'R', 'NC-17']
	end
	def self.selected_sort
		return 'title'
	end
end
