require 'watir-webdriver'
require 'cucumber'

When(/^Navigate to Category page BILDER$/) do
  @browser.link(:xpath, "html/body/div[1]/div[2]/nav/ul/li[3]/a").when_present.click
end

Then(/^Observe the Bilder L1$/) do
sleep(4)
end

And(/^Navigate to Category L2$/) do
  sleep(4)
  @browser.link(:xpath, ".//*[@id='primary']/div[1]/h1/a").when_present.click

end

And(/^Check the sortings$/) do

  @browser.select(:id, 'grid-sort-header').when_present.select('Preis aufsteigend')
  @browser.select(:id, 'grid-sort-header').when_present.select('Preis absteigend')
  @browser.select(:id, 'grid-sort-header').when_present.select('Neueste zuerst')
  @browser.select(:id, 'grid-paging-header').when_present.select('15')
  @browser.select(:id, 'grid-paging-header').when_present.select('30')
  @browser.select(:id, 'grid-paging-header').when_present.select('60')
end

And(/^Check the Ref$/) do
  @browser.div(:class, "refinement Künstler").when_present.click
  @browser.li(:text,'Aeffner, Thomas').when_present.click
  @browser.find_element(:xpath, "//div[@id='secondary']/div[5]/div").click
  @browser.find_element(:xpath, "(//input[@type='checkbox'])[2]").click
  verify { (@browser.find_element(:css, "div.product-artist-name").text).should == "Thomas Aeffner" }
end