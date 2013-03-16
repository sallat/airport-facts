Given /^the user is logged in$/ do
  visit root_path
  click_link("Sign up")
  fill_in "Name",    with: "Test"
  fill_in "Email",    with: "test@test.com"
  fill_in "Password",    with: "123456"
  fill_in "Password confirmation",    with: "123456"
  click_button("Sign up")
end

And /^they click my page link$/ do
  click_link("My Page")
end

Then /^they should see their own account page$/ do
  page.should have_content('My Very Own Account')
end