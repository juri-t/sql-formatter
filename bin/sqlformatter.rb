#!/usr/local/bin/ruby
=begin
	SQLをフォーマットします
=end
NEWLINE_WORDS = ['select', 'from', 'where', 'and', 'or', 'create', 'inner', 'left', 'right', 'full', 'cross', 'union', 'group', 'order']


RESERVED_WORDS = []
File.open("config/reserved_words.txt", "r"){|f|
	f.each_line {|line|
		RESERVED_WORDS.push(line.downcase.strip)
	}
}


lines = readlines
is_newline = false
for line in lines
	for word in line.gsub(/\s?,\s?/, ", ").gsub(/\s*=\s*/, " = ").split()
		# 改行させる?
		if NEWLINE_WORDS.include?(word.downcase) then
			print "\n" + Array.new(6 - word.length, " ").join()
		elsif is_newline then
			print Array.new(7, " ").join()
		end

		if RESERVED_WORDS.include?(word.downcase[/\w+/]) then
			print word.upcase
		else
			print word
		end

		# 改行させる?
		if word.end_with?(',', '(') then
			print "\n"
			is_newline = true
		else
			print " "
			is_newline = false
		end
	end
end
print "\n"
