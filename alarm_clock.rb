length = ARGV[0].to_i
units = ARGV[1]
usage = "
USAGE: ruby #{__FILE__} <number of units> <unit (seconds or minutes)>
Example: ruby #{__FILE__} 2 seconds
"

if units.nil? || length == 0
  system('say "Invalid parameters"')
  puts usage
  exit(1)
end

start_time = Time.now
running = true

seconds_per_unit = case units
                     when /seconds?/
                       1
                     when /minutes?/
                       60
                   end

delay_in_seconds = length * seconds_per_unit

while running
  if Time.now - start_time > delay_in_seconds
    running = false
    system('say "All done"')
  end
end

