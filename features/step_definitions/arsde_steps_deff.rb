require 'watir-webdriver'
require 'cucumber'

Given(/^User is on the home page$/) do
  @browser = Watir::Browser.new :ff
  @browser.goto 'https://storefront:osf@development-web-arsmundi.demandware.net/s/ArsMundi/de/Start'
  @browser.alert.ok
  sleep(5)
  @browser.goto 'https://development-web-arsmundi.demandware.net/s/ArsMundi/de/Start'
end

Then(/^User go to register page$/) do
  @browser.span(:text, "Einloggen").when_present.click
end

Then(/^User press on the create new user$/) do
  @browser.radio(:id, "register-radio").when_present.set
  @browser.button(:name,"dwfrm_login_register").click
end

And(/^User add his data and create account$/) do
  #Generate random pass/email
  o = [('a'..'z')].map { |i| i.to_a }.flatten
  @email = (0...5).map { o[rand(o.length)] }.join
  @pass = (0...10).map { o[rand(o.length)] }.join

#type email and pass - create new user
  @browser.text_field(:id, "dwfrm_profile_customer_email").when_present.set(@email+'@'+'gmail.com')
  @browser.text_field(:id, "dwfrm_profile_customer_emailconfirm").set(@email+'@'+'gmail.com')
  @browser.text_field(:id, "dwfrm_profile_login_password").set(@pass)
  @browser.text_field(:id, "dwfrm_profile_login_passwordconfirm").set(@pass)
  @browser.button(:name,"dwfrm_profile_confirm").when_present.click
end