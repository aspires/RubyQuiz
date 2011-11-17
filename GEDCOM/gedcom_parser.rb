require "pp"
gedcom_file = ARGV[0]

if gedcom_file == nil
  gedcom_file = "gedcom.txt"
end

def test_gedcom(line)
  return 42
end

def read_file(file)
  File.read(file)
end

def read_gedcom(file_to_read)
  file_to_read.slice(/^0 HEAD.*0 TRLR/m)
end

def parse_gedcom(gedcom_string)
  new_array = gedcom_string.split(/^(0.*)/)
  new_array.pop
  2.times {new_array.delete_at(0)}
  
  new_array.map {|string| string.gsub(/[\n]/, " ")}
end

def turn_to_hash(input_array)
  key = input_array.slice(0).strip
  output_hash = Hash.new
  
  hash_times = (input_array.length/2)
  hash_times.times do 
    loop_array = input_array.pop(2)
    loop_hash = {loop_array[0].strip=>loop_array[1].strip}
    output_hash.update(loop_hash)
  end
  
  [key, output_hash]
end

pp a= turn_to_hash(parse_gedcom((read_file(gedcom_file))))

