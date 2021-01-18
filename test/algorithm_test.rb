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

  def test_it_can_generate_shifts_from_keys_and_offsets
    key1 = {a_key: '23', b_key: '39', c_key: '90', d_key: '01'}
    offset1 = {a_offset: 4, b_offset: 6, c_offset: 4, d_offset: 1}
    @algorithm.stubs(:keys).returns(key1)
    @algorithm.stubs(:offsets).returns(offset1)
    expected1 = {a: 27, b: 45, c: 94, d: 2}
    assert_equal expected1, @algorithm.shifts
    key2 = {a_key: '41', b_key: '03', c_key: '12', d_key: '11'}
    offset2 = {a_offset: 3, b_offset: 7, c_offset: 2, d_offset: 8}
    @algorithm.stubs(:keys).returns(key2)
    @algorithm.stubs(:offsets).returns(offset2)
    expected2 = {a: 44, b: 10, c: 14, d: 19}
    assert_equal expected2, @algorithm.shifts
  end
end