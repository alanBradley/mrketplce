class ReportLogger
	attr_accessor :handle

	def initialize(filename)
		@handle = File.open(filename,'a')
	end

	def report (*items)
			@handle.print("Test Loop Start: " + "\n")

			items.each do |item|
				@handle.print(item)
			end
			@handle.puts( "-End" + "\n" + " - - - - - - - - - - - - - - ")
	end

	def read
		File.open(@handle, 'r') do |f|
			while line = f.gets
				puts line
			end
		end
	end

end

# test commands working
#f = ReportLogger.new("ReportFileTest.txt")
#f.report("Johnreport","Bradley","085 1001 101","alan@live.com","Loves Dogs")
#f.read