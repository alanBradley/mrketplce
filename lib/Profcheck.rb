require 'csv'
class Profcheck

	# Test to confirm gem working ok
  def self.hi
    puts "Hey, I've worked!"
  end

	def initialize
	   # this is the words to be used by the checker
	   
	   # tests
	   # Simple Array example expanded to use file and Hash
	   # @words = ["shit","feck","arse","tee"]
	   # @words = CSV.read('words.csv')

	   # Creates Hash from CSV file for each row grab index value[0],[1], strip each word start & end 
	   @wordSub = Hash[ readFile.map do |row|
	   	[ row[0].strip , row[1].strip ] 
	   end]

	   # for use with test to see if Hash from CSV file works
	   # puts @wordSub
	   
	   # Old test to make sure Hash:keys can work
	   
	   # Ruby Hash
	   #     @wordSub = {
	   #  "shit" => "s**t",
	   #  "feck" => "f**k",
	   #  "arse" => "a**e",
	   #  "drink" => "dr**k"
	   # }
	end

	# method will return true is there are any dodgy words in the string
	def isProfanity(str)
	  isProfane = false
	  words = @wordSub.keys

	  words.each do |x| 
	     if str.include?(x)
	       isProfanity = true
	     end
	  end
	  return isProfanity
	end

	# method will replace all dodgy words matched with a common word
	def filterProfanity(str)
	  words = @wordSub.keys 
	  
	  words.each do |x| 
	     if str.include?(x)
	        str.gsub! x, '*REMOVED WORD*'    
	     end
	  end
	  return str 
	end

	# method will use the ruby hash to substitute pre defined word values
	def swapProfanity(str)
	  words = @wordSub.keys 
	  
	  words.each do |x| 
	     if str.include?(x)
	        str.gsub! x, @wordSub[x]   
	     end
	  end
	  return str 
	end

	private

	# read in csv file containing words, words to be substituted
	def readFile
		CSV.read('lib/words.csv')
	end
end



#g = Profcheck.new()


#if g.isProfanity("shit feck arse drink ladies") then
#   puts "Bad Language Detected within content"
#end

#puts g.filterProfanity("holy shit batman, I think i've had one two many drink");
#puts g.swapProfanity("holy shit batman, I think i've had one two many drink");



