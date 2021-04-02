require "open-uri"
require "nokogiri"
doc = Nokogiri::HTML(URI.open("http://www.threescompany.com/"))
puts doc
