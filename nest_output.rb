#!/usr/bin/env ruby

require 'rubygems'
require 'nest_thermostat'

now = Time.now.to_i

nest = NestThermostat::Nest.new(email: ENV['NEST_EMAIL'], password: ENV['NEST_PASS'])

# graphite format is
# <metric name> <metric value> <time in epoch seconds>

# nest.methods - Object.methods
# [:email, :email=, :password, :password=, :login_url, :login_url=, :user_agent,
# :user_agent=, :auth, :auth=, :temperature_scale, :temperature_scale=, :login, :login=,
# :token, :token=, :user_id, :user_id=, :transport_url, :transport_url=, :transport_host, :transport_host=,
# :structure_id, :structure_id=, :device_id, :device_id=, :headers, :headers=, :status, :public_ip, :leaf,
# :humidity, :current_temperature, :current_temp, :temperature, :temp, :temperature=, :temp=,
# :target_temperature_at, :target_temp_at, :away, :away=, :temp_scale=]

%w[
current_temperature
current_temp
temperature
temp
humidity
].each do |s|
  puts "nest.#{s} #{nest.send(s)} #{now}"
end

# map .away from true/false to 1/0

%w[
away
leaf
target_temperature_at
target_temp_at
].each do |s|
  puts "nest.#{s} #{nest.send(s) ? 1 : 0} #{now}"
end
