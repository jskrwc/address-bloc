# Assignment to greet

salutation = ARGV.shift

ARGV.each do |name|
  puts "#{salutation} #{name}"
end
