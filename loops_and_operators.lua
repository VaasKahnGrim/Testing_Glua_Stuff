local var = 0

local function GLuaOperatorTest()
	local test = SysTime()
	for i = 1,1000 do
		if i != var || i != 1000 then
			continue
		else
			break
		end
	end
	return SysTime()-test*-1
end

local function LuaOperatorTest()
	local test = SysTime()
	for i = 1,1000 do
		if i ~= var or i ~= 1000 then
			continue
		else
			break
		end
	end
	return SysTime()-test*-1
end

local function IPairsTest()
	local test = SysTime()
	for k,v in ipairs(ents.GetAll())do
		print(v)
	end
	return SysTime()-test*-1
end

local function NumericLoopTest()
	local test = SysTime()
	local ents = ents.GetAll()
	for i = 1,#ents do
		local v = ents[i]
		print(v)
	end
	return (SysTime()-test)*-1
end

hook.Add('InitPostEntity','Benchmark_Testing',function()
	local GluaOp = GLuaOperatorTest()
	local luaOp = LuaOperatorTest()

	local ipairsOp = IPairsTest()
	local NumericLoop = NumericLoopTest()

	print'OPERATORS BENCHMARKS'
	print('gLua Special Operators:'..tostring(GluaOp))
	print('Lua Default Operators:'..tostring(luaOp))

	print'FOR LOOP BENCHMARKS'
	print('ipairs Benchmark:'..tostring(ipairsOp))
	print('Numeric Loop Benchmark:'..tostring(NumericLoop))
end)
