#!/usr/bin/env lua

stack = {}

function stack_replace2(r)
	stack[#stack] = nil
	stack[#stack] = r
	return r
end

function stack_replace1(r)
	stack[#stack] = r
	return r
end

function print_stack()
	for i = 1, #stack do
		print(stack[i])
	end
end

function clear_stack()
	stack = {}
end

function del()
	stack[#stack] = nil
end

function add(a, b)
	return stack_replace2(a + b)
end

function sub(a, b)
	return stack_replace2(a - b)
end

function div(a, b)
	return stack_replace2(a / b)
end

function mul(a, b)
	return stack_replace2(a * b)
end

function pow(a, b)
	return stack_replace2(a ^ b)
end

function sqrt(a)
	return stack_replace1(math.sqrt(a))
end

function sin(a)
	return stack_replace1(math.sin(a))
end

function cos(a)
	return stack_replace1(math.cos(a))
end

function tan(a)
	return stack_replace1(math.tan(a))
end

function rad(a)
	return stack_replace1(math.rad(a))
end

function deg(a)
	return stack_replace1(math.deg(a))
end

function log10(a)
	return stack_replace1(math.log(a, 10))
end

function ln(a)
	return stack_replace1(math.log(e))
end

operations = {
	['+'] = {
		desc = "Add top two numbers in stack",
		req = 2,
		func = add
	},

	['-'] = {
		desc = "Subtract top two numbers in stack",
		req = 2,
		func = sub
	},

	['/'] = {
		desc = "Divide top two numbers in stack",
		req = 2,
		func = div
	},

	['*'] = {
		desc = "Multiply top two numbers in stack",
		req = 2,
		func = mul
	},

	['^'] = {
		desc = "Find stack.2 to the power of stack.1",
		req = 2,
		func = pow
	},

	['v'] = {
		desc = "Square root top number in stack",
		req = 1,
		func = sqrt
	},

	['sin'] = {
		desc = "Sine the top number in stack",
		req = 1,
		func = sin
	},

	['cos'] = {
		desc = "Cosine the top number in stack",
		req = 1,
		func = cos
	},

	['tan'] = {
		desc = "Tangent the top number in stack",
		req = 1,
		func = tan
	},

	['rad'] = {
		desc = "Convert degrees in top of stack to radians",
		req = 1,
		func = rad
	},

	['deg'] = {
		desc = "Convert radians in top of stack to degrees",
		req = 1,
		func = deg
	},

	['log'] = {
		desc = "Take the base 10 logarithm of top number in stack",
		req = 1,
		func = log10
	},

	['ln'] = {
		desc = "Take the natural logarithm of top number in stack",
		req = 1,
		func = ln
	},

	['p'] = {
		desc = "Print full stack",
		req = 0,
		func = print_stack
	},

	['c'] = {
		desc = "Clear the stack",
		req = 0,
		func = clear_stack
	},

	['d'] = {
		desc = "Delete top stack element",
		req = 0,
		func = del
	},

	['q'] = {
		desc = "Quit program",
		req = 0,
		func = os.exit
	}
}


constants = {
	pi = math.pi,
	e = 2.718281828459
}

function help()
	for k, v in pairs(operations) do
		print(k .. '\t' .. v.desc)
	end
end


while true do
	io.write('> ')

	local line = io.read()

	-- exit on EOF
	if not line then
		io.write('\n')
		break
	end

	if line == 'help' then
		help()
		goto continue
	end

	local ret = nil

	for w in line:gmatch("%S+") do
		local n = tonumber(w)
		if not n then n = constants[w] end
		local op = operations[w]

		if n then
			table.insert(stack, n)
		elseif op then
			if #stack >= op.req then
				if op.req == 0 then
					ret = op.func()
				elseif op.req == 1 then
					ret = op.func(stack[#stack])
				elseif op.req == 2 then
					ret = op.func(stack[#stack - 1], stack[#stack])
				end
			end
		end
	end

	if ret ~= nil then
		print(ret)
	end

	::continue::
end

