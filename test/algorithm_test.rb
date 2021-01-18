require "./test/test_helper"

class AlgorithmTest < Minitest::Test
  def setup
    @parent = mock('cipher')
    @algorithm = Algorithm.new(@parent)
  end

  def test_it_exists_and_has_attributes
    assert_instance_of Algorithm, @algorithm
  end

  def test_it_can_generate_keys
    @parent.stubs(:key).returns('23901')
    expected1 = {a_key: '23', b_key: '39', c_key: '90', d_key: '01'}
    assert_equal expected1, @algorithm.keys
    @parent.stubs(:key).returns('32871')
    expected2 = {a_key: '32', b_key: '28', c_key: '87', d_key: '71'}
    assert_equal expected2, @algorithm.keys
  end
end