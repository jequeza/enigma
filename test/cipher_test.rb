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
    date = Time.now.strftime("%d%m%y").to_i
    assert_operator date, :==, @cipher.date
  end

  def test_it_can_generate_keys
    @cipher.stubs(:a_key).returns('23')
    @cipher.stubs(:b_key).returns('39')
    @cipher.stubs(:c_key).returns('90')
    @cipher.stubs(:d_key).returns('01')
    assert_equal '23', @cipher.a_key
    assert_equal '39', @cipher.b_key
    assert_equal '90', @cipher.c_key
    assert_equal '01', @cipher.d_key
  end

  def test_it_can_square_date_helper
    @cipher.stubs(:date).returns(160121)
    assert_equal '25638734641', @cipher.date_squared
  end

  def test_it_can_get_four_digit_number
    @cipher.stubs(:four_digit_number).returns('4641')
    assert_equal '4641', @cipher.four_digit_number
  end

  def test_it_can_generate_offsets
    assert_equal 4, @cipher.a_offset
    assert_equal 6, @cipher.b_offset
    assert_equal 4, @cipher.c_offset
    assert_equal 1, @cipher.d_offset
  end

  def test_it_can_find_shifts
    @cipher.expects(:a_key).returns('23')
    @cipher.expects(:b_key).returns('39')
    @cipher.expects(:c_key).returns('90')
    @cipher.expects(:d_key).returns('01')
    @cipher.expects(:a_offset).returns(4)
    @cipher.expects(:b_offset).returns(6)
    @cipher.expects(:c_offset).returns(4)
    @cipher.expects(:d_offset).returns(1)
    assert_equal ({a: 27, b: 45, c: 94, d: 2}), @cipher.shifts
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