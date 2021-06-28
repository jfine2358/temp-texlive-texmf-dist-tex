-- Functions for making brackets strict:

stricttexAddBracesToBrackets = function(str)
	p = str:find('[%[%]]')
	if p then
		while true do
			if str:sub(p-1,p-1) == '\\' then
				q = str:sub(p+1,-1):find('[%[%]]')
				if q then
					p = p + q
				else
					break
				end
			elseif str:sub(p-1,p+1) == '<[>' or str:sub(p-1,p+1) == '<]>' then
				str = str:sub(1,p-2) .. str:sub(p,p) .. str:sub(p+2,-1)
				q = str:sub(p,-1):find('[%[%]]')
				if q then
					p = p + q - 1
				else
					break
				end
			elseif str:sub(p,p) == '[' then
				str = str:sub(1,p) .. '{' .. str:sub(p+1,-1)
				q = str:sub(p+2,-1):find('[%[%]]')
				if q then
					p = p + q + 1
				else
					break
				end
			else -- i.e. if str:sub(p,p) == ']'
				str = str:sub(1,p-1) .. '}' .. str:sub(p,-1)
				q = str:sub(p+2,-1):find('[%[%]]')
				if q then
					p = p + q + 1
				else
					break
				end				
			end
		end
	end
	return str
end

stricttexStrictBracketsOn = function()
	luatexbase.add_to_callback(
		"process_input_buffer", stricttexAddBracesToBrackets , "stricttexStrictBrackets"
	)
	ifStricttexStrictBracketsOn = true
end

stricttexStrictBracketsOff = function()
	if ifStricttexStrictBracketsOn then
		luatexbase.remove_from_callback(
			"process_input_buffer", "stricttexStrictBrackets"
		)
		ifStricttexStrictBracketsOn = false
	else
		tex.sprint('\\begingroup\\ExplSyntaxOn\\msg_error:nnnn { stricttex } { callback_not_registered } { \\StrictBracketsOn } { \\StrictBracketsOff }\\endgroup')
	end
end

-- Functions for numbers (and possibly primes) in command names

stricttexReplaceNumbersByLetters = function(str)
	str = str:gsub('0','numberZERO')
	str = str:gsub('1','numberONE')
	str = str:gsub('2','numberTWO')
	str = str:gsub('3','numberTHREE')
	str = str:gsub('4','numberFOUR')
	str = str:gsub('5','numberFIVE')
	str = str:gsub('6','numberSIX')
	str = str:gsub('7','numberSEVEN')
	str = str:gsub('8','numberEIGHT')
	str = str:gsub('9','numberNINE')
	return str
end

stricttexFormatNumbers = function(str)
	local p, q = str:find('\\%a+%d')
	if p then
		while true do
			local r,s = str:sub(q,-1):find('%w+') -- ^ in the beginning did not work
			local newstring = stricttexReplaceNumbersByLetters( str:sub(q,q+s-1) )
			local l = string.len(newstring)
			str = str:sub(1, q-1) .. newstring .. str:sub(q+s,-1)
			local t = str:sub(q+l,-1):find('\\%a+%d')
			if t then
				q = q + l + t - 1
			else
				break
			end
		end
	end
	return str
end

stricttexReplacePrimes = function(str)
	str = str:gsub('\'','symbolPRIME')
	return str
end


stricttexFormatNumbersAndPrimes = function(str)
	local p, q = str:find('\\%a+[%d\']')
	if p then
		while true do
			local r,s = str:sub(q,-1):find('[%w\']+') -- ^ in the beginning did not work
			local newstring = stricttexReplaceNumbersByLetters( stricttexReplacePrimes( str:sub(q,q+s-1) ) )
			local l = string.len(newstring)
			str = str:sub(1, q-1) .. newstring .. str:sub(q+s,-1)
			local t = str:sub(q+l,-1):find('\\%a+[%d\']')
			if t then
				q = q + l + t - 1
			else
				break
			end
		end
	end
	return str
end

stricttexNumbersInCommandsOn = function()
	if ifStricttexNumbersAndPrimesInCommands then
		stricttexNumbersAndPrimesInCommandsOff()
	end
	luatexbase.add_to_callback(
		"process_input_buffer", stricttexFormatNumbers , "stricttexNumbersInCommands"
	)
	ifStricttexNumbersInCommands = true
end

stricttexNumbersInCommandsOff = function()
	if ifStricttexNumbersInCommands then
		luatexbase.remove_from_callback(
			"process_input_buffer", "stricttexNumbersInCommands"
		)
		ifStricttexNumbersInCommands = false
	else
		tex.sprint('\\begingroup\\ExplSyntaxOn\\msg_error:nnnn { stricttex } { callback_not_registered } { \\NumbersInCommandsOn } { \\NumbersInCommandsOff }\\endgroup')
	end
end

stricttexNumbersAndPrimesInCommandsOn = function()
	if ifStricttexNumbersInCommands then
		stricttexNumbersInCommandsOff()
	end
	luatexbase.add_to_callback(
		"process_input_buffer", stricttexFormatNumbersAndPrimes , "stricttexNumbersAndPrimesInCommands"
	)
	ifStricttexNumbersAndPrimesInCommandsOn = true
end

stricttexNumbersAndPrimesInCommandsOff = function()
	if ifStricttexNumbersAndPrimesInCommandsOn then
		luatexbase.remove_from_callback(
			"process_input_buffer", "stricttexNumbersAndPrimesInCommands"
		)
		ifStricttexNumbersAndPrimesInCommandsOn = false
	else
		tex.sprint('\\begingroup\\ExplSyntaxOn\\msg_error:nnnn { stricttex } { callback_not_registered } { \\NumbersAndPrimesInCommandsOn } { \\NumbersAndPrimesInCommandsOff }\\endgroup')
	end
end