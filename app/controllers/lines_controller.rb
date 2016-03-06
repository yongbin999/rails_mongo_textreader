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
		 render plain: params[:line].inspect
	end
end
