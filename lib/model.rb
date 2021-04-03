require 'open-uri'
require 'nokogiri'
require_relative './gem'
require_relative './constants'

class Model
  attr_reader :results

  def initialize(search_input)
    @results = query_results(search_input)
  end

  private

  def keyword(search_input)
    search_input.split.join('+')
  end

  def query_results(search)
    url = SEARCH_URL + keyword(search)
    puts 'please wait while fetching gems'
    doc = Nokogiri::HTML(URI.open(url))
    convert_to_gems doc
  end

  # Nokogiri selectors destrucuring

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
