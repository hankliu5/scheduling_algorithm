module Scheduling
  # Longest Processing Time Scheduling
  def self.lpt_scheduling schedule, num_processor
    schedule.sort! { |a, b| b <=> a } # sort by descending order
    Scheduling.list_scheduling(schedule, num_processor)
  end

  # Shortest Processing Time Scheduling
  def self.spt_scheduling schedule, num_processor
    schedule.sort!
    Scheduling.list_scheduling(schedule, num_processor)
  end

  # List Scheduling
  def self.list_scheduling schedule, num_processor
    processor = Array.new(num_processor, 0)
    total_c = Array.new(num_processor, 0)
    objective_arr = Array.new(num_processor) { Array.new }
    (0...schedule.length).each do |i|
      j = processor.index(processor.min)
      processor[j] += schedule[i]
      total_c[j] += processor[j]
      objective_arr[j] << Scheduling.convert_int_to_char(i)
    end
    self.print_result(processor, total_c, objective_arr)
  end

  def self.mc_naughton schedule, num_processor
    average_c_max = schedule.reduce(:+) / num_processor
    processor = Array.new(num_processor, 0)
    total_c = Array.new(num_processor, 0)
    objective_arr = Array.new(num_processor) { Array.new }
    j = 0
    (0...schedule.length).each do |i|
      if (processor[j] + schedule[i]) <= average_c_max
        processor[j] += schedule[i]
        total_c[j] += processor[j]
        objective_arr[j] << Scheduling.convert_int_to_char(i)
      elsif j == num_processor - 1
        processor[j] += schedule[i]
        total_c[j] += processor[j]
        objective_arr[j] << Scheduling.convert_int_to_char(i)
      else
        difference = average_c_max.floor - processor[j]
        schedule[i] -= difference
        objective_arr[j] << "#{Scheduling.convert_int_to_char(i)} (last #{difference} hour(s))"
        processor[j] += difference

        j += 1

        processor[j] += schedule[i]
        total_c[j] += processor[j]
        objective_arr[j] << "#{Scheduling.convert_int_to_char(i)} (first #{schedule[i]} hour(s))"
      end
    end
    self.print_result(processor, total_c, objective_arr)
  end

  def self.convert_int_to_char n
    n += 1
    string = ""
    while n > 0 do
      n -= 1
      string = (n % 26 + 65).chr + string
      n -= n % 26
      n /= 26
    end
    return string
  end

  def self.print_current_schedule schedule
    puts "Current schedule:"
    (0...schedule.length).each do |i|
      puts "#{Scheduling.convert_int_to_char(i)}: #{schedule[i]}"
    end
  end

  def self.print_result processor, total_c, objective_arr
    (0...processor.length).each do |i|
      puts
      puts "Works in processor #{i + 1}: #{objective_arr[i].to_s}"
      puts "Time consumes by processor #{i + 1}: #{processor[i]}"
      puts "Total time comsumption by processor #{i + 1}: #{total_c[i]}"
    end
  end
end
