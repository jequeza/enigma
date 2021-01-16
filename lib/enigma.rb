class Enigma
  attr_reader :file_in,
              :file_out

  def initialize
    @file_in = ARGV[0]
    @file_out = ARGV[1]
  end

  def read
    handle = File.open(@file_in, "r")
    text_in = handle.readlines
    handle.close
    text_in
  end

  def write
    writer = File.open(@file_out, "w")
    writer.write(encryption)
    writer.close
  end
end



