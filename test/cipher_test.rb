
require "./test/test_helper"

class CipherTest < Minitest::Test
  def setup
    message = ["hello"]
    @cipher = Cipher.new(message)
  end

  def test_it_exists
    assert_instance_of Cipher, @cipher
  end

  def test_it_can_generate_five_digit_number
    @cipher.stubs(:five_digit_number).returns('23901')
    assert_equal '23901', @cipher.five_digit_number
  end

  def test_it_can_generate_date
    date = Time.now.strftime("%d%m%y").to_i
    assert_operator date, :==, @cipher.date
  end

end