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
    [@index, @name, @version, @downloads]
  end

  def menu_data
    body = "#{@description} \n\n version: #{@version} \n\n downloads: #{@downloads}"
    [@name, body]
  end
end
