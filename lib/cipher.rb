class Cipher
  def initialize(message)
    @message = message
  end

  def five_digit_number
    num = Array.new(5) { rand(0...9) }
    num.join
  end

  def date
    Time.now.strftime("%d%m%y").to_i
  end
end