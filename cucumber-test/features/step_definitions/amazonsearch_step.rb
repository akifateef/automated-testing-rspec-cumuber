Given(/^a user goes to Amazon home page$/) do
  @browser.goto("http://www.amazon.com")
end

When(/^a user search for "([^"]*)"$/) do |arg|
  @browser.text_field(:id => "twotabsearchtextbox").wait_until(&:present?)
  @browser.text_field(:id => "twotabsearchtextbox").set "#{arg}"
  @browser.send_keys :return
end

Then(/^amazon should return result for "([^"]*)"$/) do |arg|
  @browser.text_field(:id => "twotabsearchtextbox").wait_until(&:present?)
  page_output = @browser.text_field(:id => "twotabsearchtextbox").value.include? "#{arg}"
  expect(page_output).to eql(true)
  @browser.close
end
