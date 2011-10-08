#not even close to being done

require "pp"
rows = ARGV[0].to_i

pascal = Array.new

rows.times do |x|
  pascal << Array.new
end

pascal.each_with_index do |x, i|
  (i+1).times do x.push(0)
  end
end

pp pascal