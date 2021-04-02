require "open-uri"
require "nokogiri"
doc = Nokogiri::HTML(URI.open("https://rubygems.org/search?query=terminal"))
doc.css("gems__gem","h2").each {|h2| puts h2.content}
