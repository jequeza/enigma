require "./test/test_helper"

class CipherTest < Minitest::Test
  def setup
    @cipher = Cipher.new
  end

  def test_it_exists_and_has_attributes
    assert_instance_of Cipher, @cipher
    assert_equal '', @cipher.key
    @cipher.stubs(:key).returns('11111')
    assert_equal '11111', @cipher.key
    expected = ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z', ' ']
    assert_equal expected, @cipher.alphabet
    assert_instance_of Algorithm, @cipher.al
  end

  def test_it_can_generate_five_digit_number
    @cipher.stubs(:five_digit_number).returns('23901')
    assert_equal '23901', @cipher.five_digit_number
    assert_equal 5, @cipher.five_digit_number.length
  end

  def test_it_can_generate_date
    date = Time.now.strftime("%d%m%y")
    assert_operator date, :==, @cipher.date
  end

  def test_it_can_encrypt_message
    @cipher.stubs(:shifts).returns({a: 3, b: 27, c: 73, d: 20})
    message = ['hello world']
    assert_equal "keder ohulw", @cipher.encrypt(message)
  end

  def test_it_can_decrypt_message
    message = ["keder ohulw"]
    @cipher.stubs(:shifts).returns({a: 3, b: 27, c: 73, d: 20})
    assert_equal "hello world", @cipher.decrypt(message)
  end

  def test_length_helper
    assert_equal 27, @cipher.alphabet_length
  end

  def test_it_can_get_shifts
    al = mock('algorithm')
    info = {a: 4, b: 6, c: 4, d: 1}
    al.stubs(:shifts).returns(info)
    assert_equal info, @cipher.shifts
  end

  def test_index_to_letters_helper
    expected = {
                1 => 'a',
                2 => 'b',
                3 => 'c',
                4 => 'd',
                5 => 'e',
                6 => 'f',
                7 => 'g',
                8 => 'h',
                9 => 'i',
                10 => 'j',
                11 => 'k',
                12 => 'l',
                13 => 'm',
                14 => 'n',
                15 => 'o',
                16 => 'p',
                17 => 'q',
                18 => 'r',
                19 => 's',
                20 => 't',
                21 => 'u',
                22 => 'v',
                23 => 'w',
                24 => 'x',
                25 => 'y',
                26 => 'z',
                27 => ' '
                }

    assert_equal expected, @cipher.index_to_letters
  end

  def test_letters_to_index_helper
    expected = {
                'a' => 1,
                'b' => 2,
                'c' => 3,
                'd' => 4,
                'e' => 5,
                'f' => 6,
                'g' => 7,
                'h' => 8,
                'i' => 9,
                'j' => 10,
                'k' => 11,
                'l' => 12,
                'm' => 13,
                'n' => 14,
                'o' => 15,
                'p' => 16,
                'q' => 17,
                'r' => 18,
                's' => 19,
                't' => 20,
                'u' => 21,
                'v' => 22,
                'w' => 23,
                'x' => 24,
                'y' => 25,
                'z' => 26,
                ' ' => 27
                }

    assert_equal expected, @cipher.letters_to_index
  end

  def test_big_shift_helper
    assert_equal true, @cipher.big_shift?(73, 12)
  end

  def test_shift_amount_left_helper
    assert_equal 27, @cipher.shift_amount_left(27, 27)
    assert_equal 8, @cipher.shift_amount_left(3, 11)
  end

  def test_shift_helper
    message = ['hello']
    @cipher.stubs(:shifts).returns({a: 3, b: 27, c: 73, d: 20})
    expected = {1 => 3,2 => 27, 3 => 73, 4 => 20, 5 => 3}
    assert_equal expected, @cipher.shift(message)
  end
end