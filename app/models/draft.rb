class Draft
  attr_reader :filename

  def initialize(name)
    name += ".markdown" unless name.end_with?(".markdown")
    if File.exists?(File.join(DRAFTS_PATH, name))
      @filename = File.join(DRAFTS_PATH, name)
    elsif File.exists?(name) and File.realpath(name).start_with?(DRAFTS_PATH)
      @filename = File.absolute_path(name)
    else
      raise Exception.new("Could not find file")
    end
  end

  def self.all
    Dir.glob(File.join(DRAFTS_PATH, "*.markdown")).sort
  end

  def self.first
    self.all.first
  end

  def self.last
    self.all.last
  end

  def content
    data = ""
    File.open(filename, "r") do |f|
      data = f.read
    end
    return data
  end

  def save(content)
    File.open(filename, "w") do |f|
      f.write(content)
    end
  end
end
