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

  def date_squared
    (date ** 2).to_s
  end

  def four_digit_number
    date_squared[-4, 4]
  end

  def a_offset
    four_digit_number[0].to_i
  end

  def b_offset
    four_digit_number[1].to_i
  end

  def c_offset
    four_digit_number[2].to_i
  end

  def d_offset
    four_digit_number[3].to_i
  end

  def shifts
    all_shifts = {}
    all_shifts[:a] = (a_key.to_i) + a_offset
    all_shifts[:b] = (b_key.to_i) + b_offset
    all_shifts[:c] = (c_key.to_i) + c_offset
    all_shifts[:d] = (d_key.to_i) + d_offset
    all_shifts
  end
end