Given /^someone is on the home page$/ do
  visit root_path
end

And /^they click the sign up link$/ do
  click_link("Sign up")
end

Then /^they should be on the sign up page$/ do
  page.should have_content('Sign up if you want access')
end

When /^they submit the sign up form$/ do
  fill_in "Name",    with: "Test"
  fill_in "Email",    with: "test@test.com"
  fill_in "Password",    with: "123456"
  fill_in "Password confirmation",    with: "123456"
  click_button("Sign up")
end

Then /^they should see a success message$/ do
  page.should have_content('You have signed up successfully.')
end
