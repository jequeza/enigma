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
    expected1 = {a: '23', b: '39', c: '90', d: '01'}
    assert_equal expected1, @algorithm.keys
    @parent.stubs(:key).returns('32871')
    expected2 = {a: '32', b: '28', c: '87', d: '71'}
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
    expected1 = {a: 4, b: 6, c: 4, d: 1}
    assert_equal expected1, @algorithm.offsets
    @algorithm.stubs(:square_date).returns('1672401025')
    expected1 = {a: 1, b: 0, c: 2, d: 5}
    assert_equal expected1, @algorithm.offsets
  end

  def test_it_can_generate_shifts_from_keys_and_offsets
    key1 = {a: '23', b: '39', c: '90', d: '01'}
    offset1 = {a: 4, b: 6, c: 4, d: 1}
    @algorithm.stubs(:keys).returns(key1)
    @algorithm.stubs(:offsets).returns(offset1)
    expected1 = {a: 27, b: 45, c: 94, d: 2}
    assert_equal expected1, @algorithm.shifts
    key2 = {a: '41', b: '03', c: '12', d: '11'}
    offset2 = {a: 3, b: 7, c: 2, d: 8}
    @algorithm.stubs(:keys).returns(key2)
    @algorithm.stubs(:offsets).returns(offset2)
    expected2 = {a: 44, b: 10, c: 14, d: 19}
    assert_equal expected2, @algorithm.shifts
  end
end