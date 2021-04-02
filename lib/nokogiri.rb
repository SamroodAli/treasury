require 'open-uri'
require 'nokogiri'
require_relative './gem'

def query_results(search)
  doc = Nokogiri::HTML(URI.open("https://rubygems.org/search?query=#{search}"))
  doc.css('.gems__gem').map { |query| GemData.new(*query_data(query)) }
end

def query_data(query)
  gems_info = query.css('.gems__gem__info')
  description = gems_info.css('.gems__gem__desc').text
  name, version = gems_info.css('.gems__gem__name').text.split
  downloads_count = query.css('.gems__gem__downloads__count').text.split[0]
  [name, version, description, downloads_count]
end
