require "open-uri"
require "nokogiri"
doc = Nokogiri::HTML(URI.open("https://rubygems.org/search?query=terminal"))


doc.css(".gems__gem").css(".gems__gem__name").each do |ele|
  version = ele.css(".gems__gem__version").text
end
