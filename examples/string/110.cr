# string.cr:3338
haiku = "the first cold shower
even the monkey seems to want
a little coat of straw"
haiku.each_line do |stanza|
  puts stanza.upcase
end
# => THE FIRST COLD SHOWER
# => EVEN THE MONKEY SEEMS TO WANT
# => A LITTLE COAT OF STRAW
