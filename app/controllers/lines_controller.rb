class LinesController < ApplicationController
	def index
	end

	# get the last file id in system, if exist try to get the line requested and return the string
	def get
		line = params[:line]
		## this can be slow, can use a counter instead
		##lastid = NewFile.all.sort({"fileid" => -1}).limit(1).first().fileid
		lastid = 1

		if lastid
			@res_line = NewFile.where(:fileid => lastid, :line => line)[0]
			if @res_line		
				#puts @res_line
				@content = @res_line.content
			    render text: @content, :status => :ok
			else
			    render :file => 'public/413.html', :status => :request_entity_too_large, :layout => false
			end

		else
			render :file => 'public/413.html', :status => :request_entity_too_large, :layout => false
		end #end if
		
	end #end get
end
