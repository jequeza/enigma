class Cipher
  attr_reader :key,
              :message,
              :alphabet

  def initialize(message)
    @message = message
    @key = ''
    @alphabet = ('a'..'z').to_a << ' '
  end

  def five_digit_number
    num = Array.new(5) { rand(0...9) }
    num_joined = num.join
    @key = num_joined
    num_joined
  end

  def date
    Time.now.strftime("%d%m%y").to_i
  end
end