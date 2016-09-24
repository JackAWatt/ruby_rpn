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
def compute(a, operator, b)
	a.to_f.send(operator.to_sym, b.to_f)	
end
i = 0
input = gets.strip
stack = input.gsub(/\s+/m, ' ').strip.split(" ")
if stack.length < 3
	puts "not enough operators"
else
	while stack.length > 1
		if !stack[i].numeric?
			stack[i-2] = compute(stack[i-2],stack[i],stack[i-1])
			stack.delete_at(i)
			stack.delete_at(i-1)
			i = 0
		else
			i = i + 1
		end
	end
end
p stack
