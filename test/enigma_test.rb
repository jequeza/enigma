require "./test/test_helper"

class EnigmaTest < Minitest::Test
  def setup
    @enigma = Enigma.new
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
end

