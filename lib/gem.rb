require 'colorize'
class GemData
  attr_reader :name, :version, :description, :downloads

  def initialize(index, name, version, description, downloads)
    @index = index
    @name = name
    @version = version
    @description = description
    @downloads = downloads
  end

  def table_row_format
    [@index.to_s.colorize(:light_white), @name.colorize(:cyan), @version.colorize(:light_white), @downloads.colorize(:cyan)]
  end

  def menu_data
    body = "#{@description.colorize} \n\n version: #{@version} \n\n downloads: #{@downloads}"
    [@name, body]
  end
end
