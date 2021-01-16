
require "./test/test_helper"

class CipherTest < Minitest::Test
  def setup
    message = ["hello"]
    @cipher = Cipher.new(message)
  end

  def test_it_exists
    assert_instance_of Cipher, @cipher
  end
end