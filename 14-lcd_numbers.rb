########################################################################
#       Solution to Ruby Quiz #14 "LCD Numbers" by Austin Spires       #
#      Problem can be found at http://www.rubyquiz.com/quiz14.html     #
########################################################################

if ARGV[0] == "-s"
  expand = ARGV[1].to_i
  input_num = ARGV[2].to_s.split(//)
  else
    expand = 2
    input_num = ARGV[0].to_s.split(//)
end

lat   =   " " +("-" * expand)+ " "
long2 = (("|"+(" " * expand)+ "|" ))
long1 = ((" "+(" " * expand)+ "|"))
long3 = (("|"+(" " * expand)+ " "))
none  =  " " +(" " * expand)+ " "

zero  = [lat, long2, none, long2, lat]
one   = [none, long1, none, long1, none] 
two   = [lat, long1 , lat, long3, lat]
three = [lat, long1, lat, long1, lat]
four  = [none, long2, lat, long1, none]
five  = [lat, long3, lat, long1, lat]
six   = [lat, long3, lat, long2, lat]
seven = [lat, long1, none, long1, none]
eight = [lat, long2, lat, long2, lat]
nine  = [lat, long2, lat, long1, lat]

lcd_num = [zero, one, two, three, four, five, six, seven, eight, nine]

def convert_to_lcd(int, array)
  return array.fetch(int.to_i)
end

output_num = input_num.map { |x| x = convert_to_lcd(x, lcd_num) }

output_num.map.with_index do |x|
  x.map.with_index { |num , i| output_num[0][i] = output_num[0][i] + " " + num }
end
      
output_num.map do |x|
  expander = expand + 2
  contract = expand - 1
  
  x.each { |str| str.slice!(0..expander) }
  contract.times do x.insert(3, x[3]) end
  contract.times do x.insert(1, x[1]) end
end  

puts output_num.first


