require 'rubygems'
require 'louxewtey-client'

client = LouXewTey::Client.new
events = client.get_list_of(:resource => "evenements")

puts events
