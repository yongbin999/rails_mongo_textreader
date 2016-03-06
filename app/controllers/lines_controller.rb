class LinesController < ApplicationController
	def index
	end

	def get
		@line = params[:line]
		@res_line = NewFile.where(:fileid => 1, :line => @line)[0]
		
		if @res_line		
			#puts @res_line
			@content = @res_line.content
		    render text: @content, :status => :ok
		else
		    render :file => 'public/413.html', :status => :request_entity_too_large, :layout => false
		end

	end
end
