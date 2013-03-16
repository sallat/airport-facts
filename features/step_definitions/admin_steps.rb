Given /^the admin is on the home page$/ do
  visit root_path
end

Then /^he should see the admin sign in link$/ do
  page.should have_content('Admin login')
end

When /^he clicks the admin link$/ do
  click_link("Admin login")
end

Then /^he should be on the admin sign in page$/ do
  page.should have_content('Sign in')
end

When /^he signs in as admin$/ do
  fill_in "Email",    with: "admin@admin.com"
  fill_in "Password", with: "mypassword"
  click_button("Sign in")
end

Then /^he should be logged in$/ do
  page.should have_content('Signed in successfully')
end

Given /^the admin visits admin tool page$/ do
  visit '/admins/sign_in'
  fill_in "Email",    with: "admin@admin.com"
  fill_in "Password", with: "mypassword"
  click_button("Sign in")
  click_link("Admin tools")
end

Then /^he should be on the admin tools page$/ do
  page.should have_content('Admin Tools')
end

When /^he clicks the link to update airports$/ do
  click_link("Update Airport Details")
end 

Then /^he should be on the update airports page$/ do
  page.should have_content('Update Airport Details from the source')
end
  
  
