# set.cr:283
red_like = Set{"red", "pink", "violet"}
blue_like = Set{"blue", "azure", "violet"}

case "violet"
when red_like & blue_like
  puts "red & blue like color!"
when red_like
  puts "red like color!"
when blue_like
  puts "blue like color!"
end
