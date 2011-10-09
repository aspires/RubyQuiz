#not even close to being done

require "pp"
rows = ARGV[0].to_i

pascal = Array.new

pascal << [1]
rows = rows -1
pascal << [1,1]
rows = rows -1
row_index = 1

while rows > 0 
  prevrow = pascal[row_index]
  prevrow_length = prevrow.length
  starting = 0
  new_array = [1]
  while starting < prevrow_length -1
  next_place = starting+1
  new_array << prevrow[starting].to_i + prevrow[next_place].to_i
  
  starting = next_place
  
  end
  
  new_array << 1
  
  pascal << new_array
  row_index +=1
  
  rows -= 1
  
end

pp pascal