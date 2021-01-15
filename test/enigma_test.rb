require "./test/test_helper"

class EnigmaTest < Minitest::Test
  def setup
    @enigma = Enigma.new
  end

  def test_it_exists_and_has_attributes
    assert_instance_of Enigma, @enigma
    assert_equal ARGV[0], @enigma.file_in
    assert_equal ARGV[1], @enigma.file_out
  end
end

