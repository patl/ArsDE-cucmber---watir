require 'watir-webdriver'
require 'cucumber'


Given(/^user goes to Arsmunfi de site$/) do
  @browser = Watir::Browser.new :ff

  @browser.alert.ok
  @browser.goto 'http://development-web-arsmundi.demandware.net/s/ArsMundi/de/Start'
  saved_cookies = browser.cookies.to_a

  @browser.goto 'https://storefront:osf@development-web-arsmundi.demandware.net/s/ArsMundi/de/Start'
  @browser.cookies.clear
  saved_cookies.each do |saved_cookie|
    @browser.cookies.add(saved_cookie[:name], saved_cookie[:value])
  end

end


When(/^The site is open user observe the Logo$/) do

 @browser.title.equal?("Ars Mundi logos")

end

And(/^Observe the Header links$/) do
  @browser.link(:text => 'Expertensuche').visible?
  @browser.link(:text => 'Merkzettel').visible?
  @browser.link(:text => 'Einloggen').visible?

    end

And(/^Observe the Menu links$/) do
  @browser.link(:text => 'Neu').visible?
  @browser.link(:text => 'Künstler A-Z').visible?
  @browser.link(:text => 'Bilder').visible?
  @browser.link(:text => 'Skulpturen').visible?
  @browser.link(:text => 'Museums-Shop').visible?
  @browser.link(:text => 'Museums-Replikate').visible?
  @browser.link(:text => 'Garten').visible?
  @browser.link(:text => 'Interieur').visible?
  @browser.link(:text => 'Schmuck').visible?
  @browser.link(:text => 'Empfehlungen').visible?
  @browser.link(:text => 'Über uns').visible?

  end

Then(/^Check Search functionality$/) do
  @browser.button(:xpath,".//*[@id='header']/header/div/div[2]/div[2]/div[1]/form/fieldset/button").click

  o = [('a'..'z'), ('A'..'Z')].map { |i| i.to_a }.flatten
  search_value = (0...10).map { o[rand(o.length)] }.join

  @browser.text_field(:id, "q").set(search_value)
  @browser.button(:xpath, ".//*[@id='header']/header/div/div[2]/div[2]/div[1]/form/fieldset/button").click

  @browser.h3(search_value).visible?

  #@browser.text.include?('ars mundi Suchergebnis').equal?
  #browser.text.include?("Zu dem Suchwort '!@#$%^&*' konnte leider kein Produkt gefunden werden").should == true
  #@browser.text.include?("ars mundi Suchergebnis").should == true
  #@browser.text.include?('Über uns').should == true


  @browser.close


 # search-result-content
end