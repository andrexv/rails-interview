class Student < ActiveRecord::Base

	scope :by_movie, ->(movie) { where("lower(favoritemovie) = ?", movie.downcase) }

	def name
		filtered = Student.all.group(:firstname).where(firstname: self.firstname).having("count(*) > 1")
		filtered.present? ? self.firstname+" "+self.lastname[0]+"." : self.firstname
	end

	def movie
		favoritemovie
	end

end
