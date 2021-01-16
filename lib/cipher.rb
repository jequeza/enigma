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

  def a_key
    @key[0..1]
  end

  def b_key
    @key[1..2]
  end

  def c_key
    @key[2..3]
  end

  def d_key
    @key[3..4]
  end
end