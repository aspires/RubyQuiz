#not even close to being done

require "pp"
triangle_size = ARGV[0].to_i

pascal = Array.new

pascal << [1]

(triangle_size-1).downto(1) do
  prevrow = pascal[-1]
  prevrow_length = prevrow.length
  new_row = [1]
  
  0.upto(prevrow_length -2) do |starting|
      new_row << prevrow[starting].to_i + prevrow[(starting+1)].to_i 
  end
    
  new_row << 1
  pascal << new_row
end

largest_number = pascal[-1].sort[-1].to_s
spacer = largest_number.length
leng = pascal.length - 1

pascal.map!.with_index do |row, row_index|
  (" "*spacer)*(leng-row_index) + row.map{|n| n.to_s.center(spacer) }.join(" " * spacer)
end


puts pascal
