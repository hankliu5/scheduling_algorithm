$LOAD_PATH << '.'
require 'Scheduling'

puts "Welcome to the demo of scheduling algorithm"
puts "Enter the integer array you want to sort: (use \"e\" to end, \"s\" to show"
puts "and \"d\" to delete the last input)"

input_ary = Array.new

loop do
  input = gets.chomp
  case input
  when "s"
    Scheduling.print_current_schedule(input_ary)
  when "d"
    input_ary.delete(input_ary.last)
    Scheduling.print_current_schedule(input_ary)
  when "e"
    break
  else
    begin
      number = Integer(input)
    rescue
      puts "please enter an integer"
    else
      if number.to_s != input
        puts "please enter an integer"
        next
      end
      input_ary << number
    end
  end
end

abort("you should put some integers into the array") if input_ary.empty?

puts "\nYou are done with enter the schedules"
Scheduling.print_current_schedule(input_ary)

puts "\nHow many processors do you want to work with?"

num_processor = gets.chomp
begin
  number = Integer(input)
rescue
  puts "please enter an integer"
else
  if number.to_s != input
    puts "please enter an integer"
    next
  end
  input_ary << number
end

puts "\nNow, choose one method to plan your schedules (enter \"e\" to exit)"
puts "1. List Scheduling\n2. Longest Processing Time Scheduling\n3. Shortest Processing Time Scheduling"

loop do
  input = gets.chomp
  case input
  when "1"
