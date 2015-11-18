class ReportLogger
	# instance variable with getter setter methods
	attr_accessor :filename

	# Test to confirm gem working ok
  def self.hi
    puts "Hey, I've worked!"
  end

	# initializes file and writes-only at end of file if exists or creates new one
	def initialize(filename)
		@filename = File.open(filename,'a')
	end

	# method to take in any amount of parameters and write to file
	#	def report (*items)
	#			@filename.print("Test Loop Start: " + "\n")
	#
	#			items.each do |item|
	#				@filename.print(item)
	#			end
	#			@filename.puts( "-End" + "\n" + " - - - - - - - - - - - - - - ")
	#	end

	# method accepts two parameters and prints out message to file interpolating parameters into the message
	def report (user , comment)
		profanityReport = "Profanity Alert Message: User #{user} has input rejected text: \"#{comment}\""
		@filename.puts(profanityReport)
	end

	# reads out file contents line by line
	def read
		File.open(@filename, 'r') do |f|
			while line = f.gets
				puts line
			end
		end
	end

end

# test commands working
#f = ReportLogger.new("ReportFileTest.txt")
#f.report("alan","Bradley","085 1001 101","alan@live.com")
#f.report("alan", "comments comments comments")
#f.read

