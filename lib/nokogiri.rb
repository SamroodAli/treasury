require 'open-uri'
require 'nokogiri'
doc = Nokogiri::HTML(URI.open('https://rubygems.org/search?query=music'))

doc.css('.gems__gem').each do |query|
  downloads_count = query.css(".gems__gem__downloads__count").text.split[0]
  gems_info = query.css('.gems__gem__info')
  description = gems_info.css(".gems__gem__desc").text
  name,version = gems_info.css('.gems__gem__name').text.split
  p [name,version,description, downloads_count]
end
