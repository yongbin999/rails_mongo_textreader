class PageController < ApplicationController
	def index
	end
	def get
		 render plain: params[:line].inspect
	end
end
