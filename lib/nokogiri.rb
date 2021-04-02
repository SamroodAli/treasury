require 'open-uri'
require 'nokogiri'
doc = Nokogiri::HTML(URI.open('https://rubygems.org/search?query=terminal'))

doc.css('.gems__gem').css('.gems__gem__name').each do |query|
  content = query.text
  name = content.split[0]
  version = content.split[1]
end

doc.css('.gems__gem').each do |query|
  gems_info = query.css('.gems__gem__info')
  description = gems_info.css(".gems__gem__desc").text
  name_and_version_info = gems_info.css('.gems__gem__name').each do |query|
    content = query.text
    name = content.split[0]
    version = content.split[1]
    p [name,version,description]
  end
end
