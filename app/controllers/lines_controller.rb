class LinesController < ApplicationController
	def index
	end	
	def newfile
		 render plain: "to be added with upload plugins"
	end
	def get
		 render plain: params[:line].inspect
	end
end
