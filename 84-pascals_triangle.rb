#not even close to being done

require "pp"
rows = ARGV[0].to_i

pascal = Array.new

rows.times do |x|
  pascal << Array.new
end

pascal.each do |x|
  rows.times do x.push(" ")
  end
end

pascal.map.with_index do |row, i|

  leng = row.length
  splits = i+2
  inserts = leng/splits
  
  puts inserts

end
pp pascal