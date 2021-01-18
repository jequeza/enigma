require "./test/test_helper"

class AlgorithmTest < Minitest::Test
  def test_it_exists_and_has_attributes
    parent = mock('cipher')
    algorithm = Algorithm.new(parent)
    assert_instance_of Algorithm, algorithm
  end
end