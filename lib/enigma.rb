class Enigma
  attr_reader :file_in,
              :file_out

  def initialize
    @file_in = ARGV[0]
    @file_out = ARGV[1]
    # @cipher = Cipher.new
  end

  def read
    handle = File.open(@file_in, "r")
    text_in = handle.readlines
    handle.close
    text_in
  end

  def write
    writer = File.open(@file_out, "w")
    writer.write(read[0].upcase)
    writer.close
  end

  def display_message
    "Created #{@file_out} with the key #{@cipher.key} and date #{@cipher.date}"
  end
end



