Given(/^the following movies exist:$/) do |table|
  # table is a Cucumber::Ast::Table
	# express the regexp above with the code you wish you had
	table.hashes.each do |movie|
		Movie.create!({:title => movie["title"], :rating => movie["rating"], :director => movie["director"], :release_date => movie["release_date"]})
	end
end

Then(/^the director of "(.*?)" should be "(.*?)"$/) do |arg1, arg2|
   # express the regexp above with the code you wish you had
	@movie = Movie.find_by_title(arg1)
  assert (@movie.director == arg2)
end
