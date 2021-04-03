require 'open-uri'
require 'nokogiri'
require_relative './gem'
require_relative './constants'

class Model
  attr_reader :gems

  def initialize(search_input)
    @gems = fetch_gems(search_input)
  end

  private

  # Nokogiri selectors destrucuring to array of gems

  def fetch_gems(search)
    puts 'please wait while fetching gems'
    doc = Nokogiri::HTML(URI.open("https://rubygems.org/search?query=#{keyword(search)}"))
    convert_to_gems doc
  end

  def keyword(search_input)
    search_input.split.join('+')
  end

  def query_data(query, index)
    gems_info = query.css '.gems__gem__info'
    description = gems_info.css('.gems__gem__desc').text
    name, version = gems_info.css('.gems__gem__name').text.split
    downloads_count = query.css('.gems__gem__downloads__count').text.split[0]
    [
      index,
      name,
      version,
      description,
      downloads_count
    ]
  end

  def convert_to_gems(doc)
    results = doc.css('.gems__gem')
    results.map.with_index { |query, index| GemData.new(*query_data(query, index)) }
  end
end
