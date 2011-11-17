require "test/unit"
require_relative "gedcom_parser"

class TestGEDCOMParser < Test::Unit::TestCase
  
  def test_returns_42
    assert_equal(42, test_gedcom(' '))
  end
  
  def test_file_read
    assert_not_nil(read_file("gedcom.txt"), 
                            "File read in must not result in a nil")
  end
  
  def test_gedcom_read_to_s
    assert_instance_of(String, read_gedcom(read_file("gedcom.txt")), 
                      "read_gedcom should return an big string")
  end
  
  def test_gedcom_parsing
    assert_instance_of(Array, parse_gedcom(read_gedcom(read_file('gedcom.txt'))), 
                      "parse_gedcom should spit out an array")
  end
  
  def test_gedcom_array_cleaning
    array = parse_gedcom(read_gedcom(read_file('gedcom.txt')))
    assert_not_equal("0 TRLR", array[-1],
                    "Parsed array should not include the footer")
  end
  
  def test_array_front_cleaning_1of2
    array = parse_gedcom(read_gedcom(read_file('gedcom.txt')))
    assert_not_equal('' || "0 HEAD", array[0],
                    "Array should have the header values removed"
    )
  end
  
  def test_array_front_cleaning_2of2
    array = parse_gedcom(read_gedcom(read_file('gedcom.txt')))
    assert_not_equal("0 HEAD", array[0],
                    "Array should have the header values removed"
    )
  end
  
  def test_hash_splitter
    array = parse_gedcom(read_gedcom(read_file('gedcom.txt')))
    assert_instance_of(Array, turn_to_hash(array),
                      "Should return an array")
  end
  
  def test_did_it_make_a_hash
    test_output = turn_to_hash(parse_gedcom(read_gedcom(read_file('gedcom.txt'))))
    assert_instance_of(Hash, test_output[-1],
                      "Should have a Hash in position 1")
  end
  
  def test_no_newline_chars
    test = turn_to_hash(parse_gedcom(read_gedcom(read_file("gedcom.txt"))))
    assert_no_match(/[^\d\w\s]n/, test[0],
                    "No newlines allowed")
  end
    
  
end