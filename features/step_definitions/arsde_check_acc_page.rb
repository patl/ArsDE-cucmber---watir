require 'watir-webdriver'
require 'cucumber'


Given(/^User is log in$/) do
  @browser = Watir::Browser.new :ff
  @browser.goto 'https://storefront:osf@development-web-arsmundi.demandware.net/s/ArsMundi/de/Start'
  @browser.alert.ok
  sleep(5)
  @browser.goto 'https://development-web-arsmundi.demandware.net/s/ArsMundi/de/Start'
  sleep(10)
  @browser.span(:text, "Einloggen").click
  sleep(5)
  @browser.radio(:id, "register-radio").set
  @browser.button(:name,"dwfrm_login_register").click
  sleep(5)

#Generate random pass/email
    o = [('a'..'z')].map { |i| i.to_a }.flatten
    @email = (0...5).map { o[rand(o.length)] }.join
    pass = (0...10).map { o[rand(o.length)] }.join

#type email and pass - create new user
    @browser.text_field(:id, "dwfrm_profile_customer_email").set(@email+'@'+'gmail.com')
    @browser.text_field(:id, "dwfrm_profile_customer_emailconfirm").set(@email+'@'+'gmail.com')
    @browser.text_field(:id, "dwfrm_profile_login_password").set(pass)
    @browser.text_field(:id, "dwfrm_profile_login_passwordconfirm").set(pass)
    sleep(5)
    @browser.button(:name,"dwfrm_profile_confirm").click
    sleep(5)
  end


When(/^user is on the Ma account page he change password and relog with new one$/) do

#go Edit account page and change password.
  @browser.link(:xpath, "html/body/div[1]/div[3]/div[3]/nav/div/div/ul[1]/li[1]/a").click
  sleep(5)
  @browser.text_field(:id, "dwfrm_profile_customer_emailconfirm").set(@email+'@'+'gmail.com')
  @browser.text_field(:id, "dwfrm_profile_login_password").set('newpass123')
  @browser.text_field(:id, "dwfrm_profile_login_passwordconfirm").set("newpass123")
  @browser.button(:name,"dwfrm_profile_confirm").click
  @browser.link(:text, "Abmelden").click

  sleep(5)

#log in to the system with new password.

  @browser.text_field(:xpath, "html/body/div[1]/div[3]/div[2]/div/fieldset/div[2]/section/div/form/fieldset/div[1]/div/input").set(@email+'@'+'gmail.com')
  @browser.text_field(:xpath, "html/body/div[1]/div[3]/div[2]/div/fieldset/div[2]/section/div/form/fieldset/div[2]/div[1]/input").set('newpass123')
  @browser.button(:xpath,"html/body/div[1]/div[3]/div[2]/div/div/div/button").click
  sleep(5)

end

Then(/^He add address and changed address and delete it\.$/) do
  # add address

  @browser.link(:text, "Adressen").click
  @browser.link(:text, "Neue Adresse anlegen").click
  @browser.radio(:id, "Sir").set
  @browser.radio(:id, "Company").set
  @browser.text_field(:id, "dwfrm_profile_address_companyname").set("asdasd")
  @browser.text_field(:id, "dwfrm_profile_address_contactperson").set("asdasd")
  @browser.text_field(:id, "dwfrm_profile_address_address1").set("asdasd")
  @browser.text_field(:id, "dwfrm_profile_address_address2").set("asdasd")
  @browser.text_field(:id, "dwfrm_profile_address_zip").set("asdasd")
  @browser.text_field(:id, "dwfrm_profile_address_city").set("12345")
  @browser.button(:xpath,"html/body/div[3]/div[2]/form/fieldset/div[5]/button[2]").click

  #expect(@browser.text)to include(" asdasd")
  @browser.link(:xpath, "bearbeiten").click
  sleep(5)

  @browser.text_field(:id, "dwfrm_profile_address_companyname").set("asdasd1")
  @browser.text_field(:id, "dwfrm_profile_address_contactperson").set("asdasd1")
  @browser.text_field(:id, "dwfrm_profile_address_address1").set("asdasd1")
  @browser.text_field(:id, "dwfrm_profile_address_address2").set("asdasd1")
  @browser.text_field(:id, "dwfrm_profile_address_zip").set("asdasd1")
  @browser.button(:xpath,"html/body/div[3]/div[2]/form/fieldset/div[5]/button[2]").click

  #expect(@browser.text)to include("asdasd1")
  @browser.link(:xpath, "html/body/div[1]/div[3]/div[2]/div/ul/li/div[1]/a[2]").click
  @browser.alert.ok
  @browser.link(:xpath, "html/body/div[1]/div[3]/div[3]/nav/div/div/ul[2]/li/a").click
  @browser.link(:xpath, "html/body/div[1]/div[3]/div[3]/nav/div/div/ul[3]/li/a").click
  @browser.link(:text, "Klicken Sie hier, um Artikel hinzuzufügen.").click
end

And(/^Add CC$/) do
  pending
end