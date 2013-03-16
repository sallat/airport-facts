Given /^a user visits the home page$/ do
  visit root_path
end

And /^he should see a welcome text$/ do
  page.should have_content('Welcome to worldwide airport facts')
end

And /^he decides to click search$/ do
  click_link("Search")
end

Then /^he should be on the search page$/ do
  page.should have_content('Search for an airport')
end

When /^he searches for airports in Test$/ do
  fill_in "City",    with: "Test"
  click_button("Search")
end

Then /^the search should be processed$/ do
  page.should have_content('Search was successfully processed.')
end



