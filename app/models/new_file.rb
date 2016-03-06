class NewFile
  include Mongoid::Document
  field :fileid, type: Integer
  field :line, type: Integer
  field :content, type: String


  require 'csv'
  def self.import(file)

  	NewFile.all.destroy_all
	curfileid = 0##NewFile.last.fileid
	puts "---------------------------------"
	puts NewFile.last.inspect
	counter = 1

  	File.open(file.path, "r") do |f|
	  f.each_line do |line|

	    @new_file = NewFile.create(:fileid => curfileid+1,:line =>counter, :content =>line)

	    counter +=1

	  end
	end


  end # end self.import(file)
end
