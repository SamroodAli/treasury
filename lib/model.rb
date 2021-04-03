require 'open-uri'
require 'nokogiri'
require_relative './gem'

class Model
  attr_reader :results

  def initialize(user_input)
    @results = query_results(user_input)
  end

  private

  def query_results(search)
    puts "please wait while fetching gems"
    doc = Nokogiri::HTML(URI.open("https://rubygems.org/search?query=#{search}"))
    doc.css('.gems__gem').map.with_index { |query, index| GemData.new(*query_data(query, index)) }
  end

  def query_data(query, index)
    gems_info = query.css('.gems__gem__info')
    description = gems_info.css('.gems__gem__desc').text
    name, version = gems_info.css('.gems__gem__name').text.split
    downloads_count = query.css('.gems__gem__downloads__count').text.split[0]
    [index, name, version, description, downloads_count]
  end
end
