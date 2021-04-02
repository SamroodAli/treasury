require "open-uri"
require "nokogiri"
doc = Nokogiri::HTML(URI.open("https://rubygems.org/search?query=terminal"))


doc.css(".gems__gem").css(".gems__gem__name").each do |query|
  content = query.text
  name = content.split[0]
  version = content.split[1]
  puts name
  puts version
end
