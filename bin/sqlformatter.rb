#!/usr/local/bin/ruby
=begin
	SQLをフォーマットします
=end
RESERVED_WORDS = ['select', 'from', 'where', 'join', 'and', 'or', 'create', 'table', 'as',
	'inner', 'left', 'right', 'full', 'cross', 'union', 'all', 'in']

lines = readlines
for line in lines
	for word in line.split()
		if RESERVED_WORDS.include?(word.downcase) then
			print word.upcase
		else
			print word
		end

		print " "
	end
end
print "\n"
