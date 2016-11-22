require 'watir-webdriver'
require 'cucumber'

When(/^user is on the Ma account page he change password and relog with new one$/) do

#go Edit account page and change password.
  sleep(3)
  @browser.link(:xpath, "html/body/div[1]/div[3]/div[3]/nav/div/div/ul[1]/li[1]/a").when_present.click

  #@browser.text_field(:id, "dwfrm_profile_customer_email").when_present.set(@email+'@'+'gmail.com')
  @browser.text_field(:id, "dwfrm_profile_customer_emailconfirm").when_present.set(@email+'@'+'gmail.com')
  @browser.text_field(:id, "dwfrm_profile_login_password").when_present.set('newpass123')
  @browser.text_field(:id, "dwfrm_profile_login_passwordconfirm").when_present.set('newpass123')
  @browser.button(:xpath, 'html/body/div[1]/div[3]/div[2]/form/fieldset/div[7]/button').when_present.click
  @browser.link(:text, "Abmelden").when_present.click

  #log in to the system with new password.

  @browser.text_field(:xpath, "html/body/div[1]/div[3]/div[2]/div/fieldset/div[2]/section/div/form/fieldset/div[1]/div/input").when_present.set(@email+'@'+'gmail.com')
  @browser.text_field(:xpath, "html/body/div[1]/div[3]/div[2]/div/fieldset/div[2]/section/div/form/fieldset/div[2]/div[1]/input").when_present.set('newpass123')
  @browser.button(:xpath,"html/body/div[1]/div[3]/div[2]/div/div/div/button").when_present.click
end

Then(/^He add address and changed address and delete it\.$/) do
  # add address

  @browser.link(:text, "Adressen").when_present.click
  @browser.link(:text, "Neue Adresse anlegen").when_present.click
  @browser.radio(:id, "Sir").when_present.set
  @browser.radio(:id, "Company").when_present.set
  sleep (2)
  @browser.text_field(:id, "dwfrm_profile_address_companyname").set("asdasd")
  @browser.text_field(:id, "dwfrm_profile_address_contactperson").set("asdasd")
  @browser.text_field(:id, "dwfrm_profile_address_address1").set("asdasd")
  @browser.text_field(:id, "dwfrm_profile_address_address2").set("asdasd")
  @browser.text_field(:id, "dwfrm_profile_address_zip").set("asdasd")
  @browser.text_field(:id, "dwfrm_profile_address_city").set("12345")
  @browser.button(:xpath,"html/body/div[3]/div[2]/form/fieldset/div[5]/button[2]").when_present.click
  #expect(@browser.text)to include(" asdasd")
  @browser.link(:xpath, "html/body/div[1]/div[3]/div[2]/div/ul/li/div[1]/a[1]").when_present.click


  @browser.text_field(:id, "dwfrm_profile_address_companyname").when_present.set("asdasd1")
  @browser.text_field(:id, "dwfrm_profile_address_contactperson").set("asdasd1")
  @browser.text_field(:id, "dwfrm_profile_address_address1").set("asdasd1")
  @browser.text_field(:id, "dwfrm_profile_address_address2").set("asdasd1")
  @browser.text_field(:id, "dwfrm_profile_address_zip").set("asdasd1")
  @browser.button(:xpath,"html/body/div[3]/div[2]/form/fieldset/div[5]/button[2]").when_present.click
    #expect(@browser.text)to include("asdasd1")
  @browser.link(:xpath, "html/body/div[1]/div[3]/div[2]/div/ul/li/div[1]/a[2]").when_present.click
  @browser.alert.ok
  @browser.link(:xpath, "html/body/div[1]/div[3]/div[3]/nav/div/div/ul[2]/li/a").when_present.click
  @browser.link(:xpath, "html/body/div[1]/div[3]/div[3]/nav/div/div/ul[3]/li/a").click
  @browser.link(:text, "Klicken Sie hier, um Artikel hinzuzufügen.").when_present.click
end

And(/^Add CC$/) do
  pending
end