module FunWithStrings
  def palindrome?
    return true if self.downcase.gsub(/\W/, '') == self.downcase.gsub(/\W/, '').reverse
  end
  def count_words
    count = Hash.new(0)
	words = self.downcase.gsub(/\W/, ' ').split(' ')
	words.each { |word| count[word] += 1 }
	return count
  end
  def anagram_groups
    words = Hash.new(0)
	groups = Array.new
	self.split(' ').each { |word| words[word] = word.split('') }
	combo = words.values.combination(2).to_a
	combo.each do |set1, set2|
		if (set1 - set2).empty? && (set2 - set1).empty?
			groups << [words.key(set1), words.key(set2)]
			words.delete(words.key(set1))
			words.delete(words.key(set2))
		end
	end
	words.each { |word, alpha| groups << [word] }
	return groups
  end
end

# make all the above functions available as instance methods on Strings:

class String
  include FunWithStrings
end
