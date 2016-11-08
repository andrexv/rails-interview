require 'test_helper'

class StudentTest < ActiveSupport::TestCase

	test 'Should filter all Students by movie name' do
		@students = Student.by_movie("Taboo")
		assert_equal 2, @students.count
	end

	test 'Should ignore the case when filtering by move' do
		@students = Student.by_movie("taBoO")
		assert_equal @students.count, 2
	end

	test 'Showing only the firstname of the user, when not repeated' do
		@students = Student.where(firstname: "Shaquille")
		assert_equal @students.count, 1
		assert_equal "Shaquille", @students[0].name
	end

	test 'Showing the firstname and the initial of the lastname, when firstname is repeated' do
		@students = Student.where(firstname: "Jimmy")
		assert_equal @students.count, 2
		assert_equal "Jimmy G.", @students[0].name
		assert_equal "Jimmy B.", @students[1].name
	end

	test 'Showing the students favorite movie as movie' do
		@students = Student.where(favoritemovie: "Orange County")
		assert_equal "Orange County", @students[0].movie
	end

end
