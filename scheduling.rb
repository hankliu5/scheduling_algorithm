module Scheduling
  # Longest Processing Time Scheduling
  def Scheduling.lpt_scheduling schedule, num_processor
    schedule.sort! { |a, b| b <=> a } # sort by descending order
    Scheduling.list_scheduling(schedule, num_processor)
  end

  # Shortest Processing Time Scheduling
  def Scheduling.spt_scheduling schedule, num_processor
    schedule.sort!
    Scheduling.list_scheduling(schedule, num_processor)
  end

  # List Scheduling
  def Scheduling.list_scheduling schedule, num_processor
    processor = Array.new(num_processor, 0)
    total_c = Array.new(num_processor, 0)
    objective_arr = Array.new(num_processor) { Array.new }
    (0...schedule.length).each do |i|
      j = processor.index(processor.min)
      processor[j] += schedule[i]
      total_c[j] += processor[j]
      objective_arr[j] << Scheduling.convert_int_to_char(i)
    end
    return processor, total_c, objective_arr
  end

  def Scheduling.convert_int_to_char num
    char = (num % 26 + 65).chr
  end

  def Scheduling.print_current_schedule schedule
    puts "Current schedule:"
    (0...schedule.length).each do |i|
      puts "#{Scheduling.convert_int_to_char(i)}: #{schedule[i]}"
    end
  end
end
