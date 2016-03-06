class LinesController < ApplicationController
	def index
	end

	def get
		@line = params[:line]
		@content = NewFile.where(:fileid => 1, :line => @line)[0].content

		puts @content
		
		if @content
		      render text: @content, :status => :ok
		    else
		      render :file => 'public/413.html', :status => :request_entity_too_large, :layout => false
		end

	end
end
