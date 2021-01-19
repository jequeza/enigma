class Enigma
  attr_reader :file_in,
              :file_out,
              :message

  def initialize
    @file_in = ARGV[0]
    @file_out = ARGV[1]
    @message = ""
    @cipher = Cipher.new
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
    writer.write(decrypt(@message, '02715', '040895'))
    writer.close
  end

  def key
    @cipher.five_digit_number
  end

  def date
    @cipher.date
  end

  def display_message
    "Created #{@file_out} with the key #{key} and date #{date}"
  end

  def encrypt(message, key_in=key, date_in=date)
    message_out = {}
    message_out[:encryption] = @cipher.encrypt(message)
    message_out[:key] = key
    message_out[:date] = date
    message_out
  end

  def decrypt(message, key, date=date)
    message_out = {}
    message_out[:decryption] = @cipher.decrypt(message)
    message_out[:key] = key
    message_out[:date] = date
    message_out
  end
end



