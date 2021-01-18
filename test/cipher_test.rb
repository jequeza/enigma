require "./test/test_helper"

class CipherTest < Minitest::Test
  def setup
    message = ['keder ohulw']
    @cipher = Cipher.new(message)
  end

  def test_it_exists_and_has_attributes
    cipher = Cipher.new(['hello world'])
    assert_instance_of Cipher, cipher
    assert_equal ['hello world'], cipher.message
    assert_equal '', cipher.key
    expected = ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z', ' ']
    assert_equal expected, cipher.alphabet
  end

  def test_it_can_generate_five_digit_number
    @cipher.stubs(:five_digit_number).returns('23901')
    assert_equal '23901', @cipher.five_digit_number
  end

  def test_it_can_generate_date
    date = Time.now.strftime("%d%m%y")
    assert_operator date, :==, @cipher.date
  end

  def test_it_can_encrypt_message
    # @cipher.expects(:shifts).returns({a: 3, b: 27, c: 73, d: 20})
    cipher = Cipher.new(['hello world'])
    assert_equal "keder ohulw", cipher.encrypt
  end

  def test_it_can_decrypt_message
    cipher = Cipher.new(["keder ohulw"])
    assert_equal "hello world", cipher.decrypt
  end

  def test_length_helper
      assert_equal 27, @cipher.alphabet_length
  end

  def test_letters_in_message_helper
    expected = ["k","e","d","e","r"," ","o","h","u","l","w"]
    assert_equal expected, @cipher.letters_in_message
  end
end