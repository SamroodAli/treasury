class GemData
  attr_reader :name, :version, :description, :downloads

  def initialize(index, name, version, description, downloads)
    @index = index
    @name = name
    @version = version
    @description = description
    @downloads = downloads
  end

  def values_array
    [@index, @name, @version, @downloads]
  end

  def menu_array
    body = "#{@description} \n\n version: #{@version} \n\n downloads: #{@downloads}"
    [@name, body]
  end
end
