require "test/unit"
require_relative "gedcom_parser"



class TestGEDCOMParser < Test::Unit::TestCase
  
  def assign_raw_variables
    file = "gedcom.txt"
    blank_gedcom = read_file(file)
  end
  
  def test_returns_42
    assert_equal(42, parse_gedcom(" "))    
  end
  
  def test_file_read
    assert_not_equal(nil, read_file(file), "File read in must not result in a nil")
  end
  
  def test_file_split
    assert_instance_of(Array, split_gedcom(blank_gedcom), "split_gedcom should return an array")
  end
  
end