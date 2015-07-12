#!/usr/bin/env ruby

require 'rubygems'
require 'nest_thermostat'

now = Time.now.to_i

nest = NestThermostat::Nest.new(email: ENV['NEST_EMAIL'], password: ENV['NEST_PASS'])

# graphite format is
# <metric name> <metric value> <time in epoch seconds>

%w[
current_temp
temp
humidity
].each do |s|
  puts "nest.#{s} #{nest.send(s)} #{now}"
end



# map .away from true/false to 1/0
puts "nest.away #{nest.away ? 1 : 0} #{now}"