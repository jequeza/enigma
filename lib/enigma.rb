class Enigma
  attr_reader :file_in,
              :file_out,
              :message

  def initialize
    @file_in = ARGV[0]
    @file_out = ARGV[1]
    @cipher = Cipher.new(@message)
    @message = ""
  end

  def read
    handle = File.open(@file_in, "r")
    @message = handle.readlines
    handle.close
  end

  def write_encryption
    writer = File.open(@file_out, "w")
    writer.write(@cipher.encrypt)
    writer.close
  end

  def write_decryption
    writer = File.open(@file_out, "w")
    writer.write(@cipher.decrypt)
    writer.close
  end

  def display_message
    "Created #{@file_out} with the key #{@cipher.five_digit_number} and date #{@cipher.date}"
  end
end



