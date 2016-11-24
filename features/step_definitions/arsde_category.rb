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

  @browser.div(:class, "refinement Motive").when_present.click
  @browser.input(:xpath, 'html/body/div[1]/div[3]/div[3]/div[6]/ul/li/input[3]').when_present.click
  @browser.div(:css, "product-artist-name")==" Thomas Aeffner "
  @browser.text.include?("Thomas Aeffner")
  @browser.div(:css, '.product-artist-name')=="Thomas Aeffner"


end