class String
  def numeric?
    Float(self) != nil rescue false
  end
end

class Float
	def numeric?
		Float(self) != nil rescue false
	end
end

def compute(a, operator, b)
	a.to_f.send(operator.to_sym, b.to_f)	
end

def compute_stack(stack, i)
	if stack.length > 1
		if !stack[i].numeric?
			stack[i-2] = compute(stack[i-2],stack[i],stack[i-1])
			stack.delete_at(i)
			stack.delete_at(i-1)
			compute_stack(stack,0)
		else
			compute_stack(stack,i + 1)
		end
	end
end

def get_stack
	stack = gets.strip.gsub(/\s+/m, ' ').strip.split(" ")
end

while :input
	stack = get_stack
	compute_stack(stack, 0)
	p stack
end
