def my_reverse(s)
	s2 = ""
	for i in (s.length - 1).downto(0)
		s2 << s[i]
	end
	s2
end

puts my_reverse('Blah!')

def fibs(limit)
	fibo = [0, 1]
	while fibo.length < limit
		fibo.push(fibo[-1] + fibo[-2])
	end
	fibo
end

p fibs(3)
p fibs(8)

def my_benchmark(number_of_times)
	time_begin = Time.now
	number_of_times.times do
		yield
	end
	time_end = Time.now

	return time_end - time_begin
end

# p my_benchmark(10000) { puts "hi" }

Array.class_eval do
	def my_each
		for i in 0...self.length
			yield(self[i])
		end
	end

	def my_map
		new_array = []
		my_each do |item|
			new_array << yield(item)
		end
		new_array
	end

	def my_select
		new_array = []
		my_each do |item|
			new_array << item if yield(item)
		end
		new_array
	end
end

[1,3,5].my_each do |i|
	puts i
end

mapped_array = [1,3,5].my_map { |i| i ** 2 }

p mapped_array

selected_array = [1,2,5].my_select { |i| i.even? }

p selected_array

