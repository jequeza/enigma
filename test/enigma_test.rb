require "./test/test_helper"

class EnigmaTest < Minitest::Test
  def setup
    @enigma = Enigma.new
    @date = Time.now.strftime("%d%m%y").to_i
  end

  def test_it_exists_and_has_attributes
    assert_instance_of Enigma, @enigma
    assert_nil @enigma.file_in
    assert_nil @enigma.file_out
  end

  def test_it_has_no_message_by_default
    assert_equal '', @enigma.message
  end

  def test_it_can_read_file
    @enigma.stubs(:read).returns(["hello"])
    assert_equal ["hello"], @enigma.read
  end

  def test_it_can_write_file
    expected = {decryption: "hello", key: "34519", date: "100299"}
    @enigma.stubs(:write).returns(expected)
    assert_equal expected, @enigma.write
  end

  def test_it_has_display_message
    key_in = '14784'
    date_in = '150121'
    file = 'decrypted.txt'
    @enigma.stubs(:file_out).returns('decrypted.txt')
    @enigma.stubs(:key).returns('14784')
    @enigma.stubs(:date).returns('150121')
    message = "Created  with the key #{key_in} and date #{date_in}"
    assert_equal message, @enigma.display_message
  end

  def test_it_can_encrypt
    message = ['hello world']
    key = '02715'
    date = '040895'
    @enigma.stubs(:key).returns('02715')
    @enigma.stubs(:date).returns('040895')

    expected = {
                encryption: 'keder ohulw',
                key: '02715',
                date: '040895'
              }

    assert_equal expected, @enigma.encrypt(message, key, date)
  end

  def test_it_can_decrypt
    message = ['keder ohulw']
    key = '02715'
    date = '040895'
    expected = {
                decryption: 'hello world',
                key: '02715',
                date: '040895'
              }

    assert_equal expected, @enigma.decrypt(message, key, date)
  end

  def test_it_can_encrypt_with_no_date_and_no_key
    message = ['hello world']
    expected = {
                encryption: 'keder ohulw',
                key: '02715',
                date: '190121'
              }
    encrypted = @enigma.encrypt(message)
    assert_equal expected[:date], encrypted[:date]
  end
end

