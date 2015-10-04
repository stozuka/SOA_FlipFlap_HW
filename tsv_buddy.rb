# Module that can be included (mixin) to create and parse TSV data
module TsvBuddy
  # @data should be a data structure that stores information
  #  from TSV or Yaml files. For example, it could be an Array of Hashes.
  attr_accessor :data

  # take_tsv: converts a String with TSV data into @data
  # parameter: tsv - a String in TSV format
  def take_tsv(tsv)
    @data = []
    lines = tsv.split("\n")
    title = lines[0]
    lines.shift
    lines.each do |line|
      hash = Hash.new {}
      title_items = title.split("\t")
      items = line.split("\t")
      items.each_with_index do |item, index|
        hash[title_items[index]] = item
      end
      @data.push(hash)
    end
    @data
  end

  # to_tsv: converts @data into tsv string
  # returns: String in TSV format
  def to_tsv
    string = ''
    @data[0].keys.each_with_index do |key, index|
      string += key
      string += "\t" if index < @data[0].length - 1
    end
    string += "\n"
    @data.each do |item|
      item.values.each_with_index do |value, index|
        string += value
        string += "\t" if index < @data[0].length - 1
      end
      string += "\n"
    end
    string
  end
end
