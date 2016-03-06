class LinesController < ApplicationController
	def index
	end
	def newfile
		@file = 1
			if request.xhr?
		      render 'newfile.html'
		    else
		      respond_to do |format|
		        format.html { render :action => 'newfile', :layout => false }
		      end
		    end
	end
	def get
		@line = params[:line]
		@new_files = NewFile.where(:fileid => 1, :line => @line )
		
		if @new_files.length != 0
		      render json: @new_files , :status => :ok
		    else
		      render :file => 'public/413.html', :status => :request_entity_too_large, :layout => false
		end

	end
end
