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
  new_row = [1]
  
    while starting < prevrow_length - 1
      next_place = starting+1
      new_row << prevrow[starting].to_i + prevrow[(starting+1)].to_i 
      starting += 1
    end
    
  new_row << 1
  pascal << new_row
  row_index += 1
  rows -= 1
  
end

largest_number = pascal[-1].sort[-1].to_s
spacer = largest_number.length
leng = pascal.length

pascal.map!.with_index do |row, row_index|
  row.insert(0, (" "*spacer)*(leng-row_index))
  row.join(" " * spacer)
end


pp pascal
puts pascal
