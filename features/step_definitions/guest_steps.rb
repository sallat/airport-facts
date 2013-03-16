Given /^a guest visits the home page$/ do
  visit root_path
end

Then /^he should see a login link$/ do
  page.should have_link('Login')
end

Given /^the guest is on the home page$/ do
  visit root_path
end

And /^he wants to visit the statistics page$/ do
  page.should have_link('Statistics')
end

And /^he clicks the statistics link$/ do
  click_link('Statistics')
end

Then /^he should see a chart$/ do
  page.should have_content('Extreme Altitude Airports')
end

Given /^the guest tries to access the new review page$/ do
  visit new_review_path
end

Then /^he should be redirected to sign in page$/ do
  page.should have_content('You need to sign in')
end


