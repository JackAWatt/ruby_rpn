class Object
  def numeric?
    Float(self) != nil rescue false
  end
end

def compute(a, operator, b)
	a.to_f.send(operator.to_sym, b.to_f)	
end

def stack_delete(stack, i)
	stack.slice!(i-1..i)
end

def return_stack(stack, i)
	stack[i-2] = compute_value(stack, i)
	stack_delete(stack, i)
	return stack
end

def compute_value(stack, i)
	compute(stack[i-2],stack[i],stack[i-1])
end

def compute_stack(stack, i)
	if stack.length > 1
		if !stack[i].numeric?
			if i > 1
				stack = return_stack(stack, i)
				compute_stack(stack,0)
			end
		else
			compute_stack(stack,i + 1)
		end
	end
end

def get_stack
	stack = gets.strip.gsub(/\s+/m, ' ').split(" ")
end

while :input
	stack = get_stack
	if stack.length % 2 != 0
		compute_stack(stack, 0) rescue false
		p stack
	end
end
