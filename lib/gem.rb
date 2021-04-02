class GemData
  attr_reader :name, :version, :description, :downloads

  def initialize(name, version, description, downloads)
    @name = name
    @version = version
    @description = description
    @downloads = downloads
  end

  def values_array
    [@name,@version,@downloads]
  end
end
