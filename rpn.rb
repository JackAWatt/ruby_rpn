
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
def do_the_stuff(a, operator, b)
	a.send(operator, b)	
end
# 1:
	input = gets.strip
# 2:
	rpn_stack = input.gsub(/\s+/m, ' ').strip.split(" ")
# 3:
	if rpn_stack.length < 3
		puts "not enough operators"
	else
		while rpn_stack.length > 1
			if !rpn_stack[i].numeric?
				rpn_stack[i - 2] = do_the_stuff(rpn_stack[i-2].to_i,rpn_stack[i].to_sym,rpn_stack[i-1].to_i)
				rpn_stack.delete_at(i)
				rpn_stack.delete_at(i-1)
				i = 0
			else
				i = i + 1
			end
		end
	end
	p rpn_stack
