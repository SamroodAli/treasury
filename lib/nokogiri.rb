require "open-uri"
require "nokogiri"
doc = Nokogiri::HTML(URI.open("https://rubygems.org/search?query=terminal"))
puts doc
