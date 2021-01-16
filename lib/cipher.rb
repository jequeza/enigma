class Cipher
  def initialize(message)
    @message = message
  end

  def five_digit_number
    num = Array.new(5) { rand(0...9) }
    num.join
  end
end