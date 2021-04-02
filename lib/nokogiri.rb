require "open-uri"
require "nokogiri"
queries = []
doc = Nokogiri::HTML(URI.open("https://rubygems.org/search?query=terminal"))
doc.css("gems__gem__info","h2").each do |a|
  queries << a.content
end
puts queries
