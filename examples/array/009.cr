# array.cr:142
Array.build(3) do |buffer|
  LibSome.fill_buffer_and_return_number_of_elements_filled(buffer)
end
