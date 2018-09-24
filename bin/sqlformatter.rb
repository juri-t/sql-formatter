#!/usr/local/bin/ruby
=begin
	SQLをフォーマットします
=end
NEWLINE_WORDS = ['select', 'from', 'where', 'and', 'or', 'create', 'inner', 'left', 'right', 'full', 'cross', 'union']

RESERVED_WORDS = NEWLINE_WORDS.concat(['join', 'table', 'as', 'all', 'in'])


lines = readlines
for line in lines
	for word in line.split()
		if RESERVED_WORDS.include?(word.downcase) then
			print "\n" + word.upcase
		elsif NEWLINE_WORDS.include?(word.downcase) then
			print "\n" + word
		else
			print word
		end

		print " "
	end
end
print "\n"
