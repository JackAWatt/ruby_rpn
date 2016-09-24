class String
  def numeric?
    Float(self) != nil rescue false
  end
end
class Fixnum
	def numeric?
		Float(self) != nil rescue false
	end
end
# 
i = 0
def compute(a, operator, b)
	a.send(operator, b)	
end

input = gets.strip
stack = input.gsub(/\s+/m, ' ').strip.split(" ")
if stack.length < 3
	puts "not enough operators"
else
	while stack.length > 1
		if !stack[i].numeric?
			stack[i - 2] = compute(stack[i-2].to_f,stack[i].to_sym,stack[i-1].to_f)
			stack.delete_at(i)
			stack.delete_at(i-1)
			i = 0
		else
			i = i + 1
		end
	end
end
p stack
