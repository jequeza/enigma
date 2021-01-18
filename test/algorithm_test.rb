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

  def test_it_can_square_date
    @parent.stubs(:date).returns('160121')
    expected1 = '25638734641'
    assert_equal expected1, @algorithm.square_date
    @parent.stubs(:date).returns('040895')
    expected2 = '1672401025'
    assert_equal expected2, @algorithm.square_date
  end

  def test_it_can_generate_offsets
    @algorithm.stubs(:square_date).returns('25638734641')
    expected1 = {a_offset: 4, b_offset: 6, c_offset: 4, d_offset: 1}
    assert_equal expected1, @algorithm.offsets
    @algorithm.stubs(:square_date).returns('1672401025')
    expected1 = {a_offset: 1, b_offset: 0, c_offset: 2, d_offset: 5}
    assert_equal expected1, @algorithm.offsets
  end
end