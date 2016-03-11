class NewFile
  include Mongoid::Document
  field :fileid, type: Integer
  field :line, type: Integer
  field :content, type: String

   index({ line: 1 }, { unique: true, name: "line_index" })

  #parser on file and create into db by line
  def self.import(file)
	curfileid = 1
	counter = 1

  	File.open(file.path, "r") do |f|
	  f.each_line do |line|

	    @new_file = NewFile.create(:fileid => curfileid,:line =>counter, :content =>line)

	    counter +=1

	  end
	end


  end # end self.import(file)
end
