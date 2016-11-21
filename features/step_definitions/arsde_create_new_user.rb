Given(/^User opens the site$/) do

  @browser = Watir::Browser.new :chrome
  @browser.goto 'https://storefront:osf@development-web-arsmundi.demandware.net/s/ArsMundi/de/Start'
  #@browser.alert.ok
  sleep(5)
  @browser.goto 'https://development-web-arsmundi.demandware.net/s/ArsMundi/de/Start'
  @browser.cookies.add 'my_session', 'BAh7B0kiD3Nlc3Npb25faWQGOgZFRkk', secure: true
  sleep(10)

end

When(/^Navigate to register page$/) do
  #@browser.span.link(:text, 'Einloggen').click
  @browser.span(:text, "Einloggen").click
  sleep(5)
  @browser.radio(:id, "register-radio").set
  @browser.button(:name,"dwfrm_login_register").click
  sleep(5)
end

Then(/^Fill The form with data$/) do

  o = [('a'..'z'), ('A'..'Z')].map { |i| i.to_a }.flatten
  email = (0...5).map { o[rand(o.length)] }.join
  pass = (0...10).map { o[rand(o.length)] }.join


  @browser.text_field(:id, "dwfrm_profile_customer_email").set(email+'@'+'gmail.com')
  @browser.text_field(:id, "dwfrm_profile_customer_emailconfirm").set(email+'@'+'gmail.com')
  @browser.text_field(:id, "dwfrm_profile_login_password").set(pass)
  @browser.text_field(:id, "dwfrm_profile_login_passwordconfirm").set(pass)
  sleep(5)
end

And(/^and create account$/) do
  @browser.button(:name,"dwfrm_profile_confirm").click
end