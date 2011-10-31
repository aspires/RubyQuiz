require "test/unit"

require_relative "gedcom_parser"

class TestGEDCOMParser < Test::Unit::TestCase
  def test_returns_42
    
    assert_equal(43, parse_gedcom(" "))    
  end
end