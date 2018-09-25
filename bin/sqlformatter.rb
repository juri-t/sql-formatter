#!/usr/local/bin/ruby
=begin
	SQLをフォーマットします
=end
NEWLINE_WORDS = ['select', 'from', 'where', 'and', 'or', 'create', 'inner', 'left', 'right', 'full', 'cross', 'union']

RESERVED_WORDS = NEWLINE_WORDS.concat(['join', 'table', 'as', 'all', 'in'])

def format(word)
	if word.include?("=")
		word.gsub("=", " = ")
	else
		word
	end
end


lines = readlines
is_newline = false
for line in lines
	for word in line.split()
		# 改行させる?
		if NEWLINE_WORDS.include?(word.downcase) then
			print "\n" + Array.new(6 - word.length, " ").join()
		elsif is_newline then
			print Array.new(7, " ").join()
		end

		if RESERVED_WORDS.include?(word.downcase) then
			print format(word.upcase)
		else
			print format(word)
		end

		# 改行させる?
		if word.end_with?(',') then
			print "\n"
			is_newline = true
		else
			print " "
			is_newline = false
		end

	end
end
print "\n"
