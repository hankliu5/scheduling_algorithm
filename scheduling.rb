# Longest Processing Time Scheduling
def lpt_scheduling schedule, num_processor
  schedule.sort! { |a, b| b <=> a } # sort by descending order
  list_scheduling(schedule, num_processor)
end

# Shortest Processing Time Scheduling
def spt_scheduling schedule, num_processor
  schedule.sort!
  list_scheduling(schedule, num_processor)
end

# List Scheduling
def list_scheduling schedule, num_processor
  processor = Array.new(num_processor, 0)
  total_c = Array.new(num_processor, 0)
  objective_arr = Array.new(num_processor) { Array.new }
  (0...schedule.length).each do |i|
    j = processor.index(processor.min)
    processor[j] += schedule[i]
    total_c[j] += processor[j]
    objective_arr[j] << convert_int_to_char(i)
  end
  return processor, total_c, objective_arr
end

def convert_int_to_char num
  char = (num % 26 + 65).chr
end

arr = [4, 9, 12, 1, 3, 5, 9, 10, 8, 11, 6, 6]
result = list_scheduling(arr, 3)
puts result.to_s
result = lpt_scheduling(arr, 3)
puts result.to_s
result = spt_scheduling(arr, 3)
puts result.to_s
