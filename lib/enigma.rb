class Enigma
  attr_reader :file_in,
              :file_out,
              :message

  def initialize
    @file_in = ARGV[0]
    @file_out = ARGV[1]
    @message = ""
    read
    @cipher = Cipher.new(@message)
  end

  def read
    handle = File.open(@file_in, "r")
    @message = handle.readlines
    handle.close
  end

  def write_encryption
    writer = File.open(@file_out, "w")
    writer.write(encrypt(@message, '02715', '040895'))
    writer.close
  end

  def write_decryption
    writer = File.open(@file_out, "w")
    writer.write(@cipher.decrypt)
    writer.close
  end

  def key
    @cipher.five_digit_number
    @cipher.key
  end

  def date
    @cipher.date
  end

  def display_message
    "Created #{@file_out} with the key #{@cipher.five_digit_number} and date #{@cipher.date}"
  end

  def encrypt(message, key=key, date=date)
    message = {}
    message[:encryption] = @cipher.encrypt
    message[:key] = key
    message[:date] = date
    message
  end
end



