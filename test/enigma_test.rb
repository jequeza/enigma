require "./test/test_helper"

class EnigmaTest < Minitest::Test
  def setup
    @enigma = Enigma.new
    @date = Time.now.strftime("%d%m%y").to_i
    # @cipher = mock('cipher')
  end

  def test_it_exists_and_has_attributes
    assert_instance_of Enigma, @enigma
    assert_nil @enigma.file_in
    assert_nil @enigma.file_out
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
    file_out = 'decrypted.txt'
    @cipher.stubs(:key).returns('14784')
    @cipher.stubs(:date).returns('150121')
    message = "Created #{file_out} with the key #{@cipher.key} and date #{@cipher.date}"
    assert_equal message, @enigma.display_message
  end
end

