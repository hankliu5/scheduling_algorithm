$LOAD_PATH << '.'
require 'Scheduling'

def welcome
  puts
  puts "Enter the integer hours you want to put into the schedule: (use \"e\" to end, \"s\" to show"
  puts "and \"d\" to delete the last input)"
end

puts "Welcome to the demo of scheduling algorithm"
welcome

input_ary = Array.new

loop do
  input = gets.chomp
  case input
  when "s"
    Scheduling.print_current_schedule(input_ary)
    welcome
  when "d"
    input_ary.delete(input_ary.last)
    Scheduling.print_current_schedule(input_ary)
    welcome
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
      elsif number <= 0
        puts "please enter an integer which is greater than zero"
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

num_processor = 0
loop do
  num_processor = gets.chomp
  begin
    number = Integer(num_processor)
  rescue
    puts "please enter an integer"
  else
    if number.to_s != num_processor
      puts "please enter an integer"
      next
    end
    num_processor = num_processor.to_i
    break
  end
end

puts "\nNow, choose one method to plan your schedules (enter \"e\" to exit)"

loop do
  puts "\n1. List Scheduling\n2. Longest Processing Time Scheduling\n3. Shortest Processing Time Scheduling\n4. \"e\" to exit"
  input = gets.chomp
  case input
  when "1"
    puts "Working on List Scheduling..."
    Scheduling.list_scheduling(input_ary, num_processor)
  when "2"
    puts "Working on Longest Processing Time Scheduling..."
    Scheduling.lpt_scheduling(input_ary, num_processor)
  when "3"
    puts "Working on Shortest Processing Time Scheduling..."
    Scheduling.spt_scheduling(input_ary, num_processor)
  when "e"
    puts "Exiting..."
    break
  else
    puts "Wrong Input."
  end
end
