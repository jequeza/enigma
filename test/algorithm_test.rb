require "./test/test_helper"

class AlgorithmTest < Minitest::Test
  def test_it_exists
    algorithm = Algorithm.new
    assert_instance_of Algorithm, algorithm
  end
end