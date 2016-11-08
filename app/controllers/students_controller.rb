class StudentsController < ApplicationController

	def index
		if params[:movie].present?
			@students = Student.all.by_movie(params[:movie])
		else 
			@students = Student.all
		end	
	end

end
