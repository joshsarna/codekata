# Create array with data
input = File.open('./weather.dat', File::RDONLY){|f| f.read }
array = input.lines.map{|l| l.split.map(&:to_f) }

# Organize array
array = array.flatten
array.delete(0.0)

# Loop through array, looking for smallest spread
index = 1
smallest_spread_day = 0
smallest_spread = 1000

30.times do
  spread = array[index + 1] - array[index + 2]
  if spread < smallest_spread
    smallest_spread = spread
    smallest_spread_day = array[index]
  end
  index += 13
  if array[index] > 1000
    index += 1
  end
end

# Print results
puts "The smallest spread is #{smallest_spread}"
puts "It occurs on day #{smallest_spread_day.to_i}" 