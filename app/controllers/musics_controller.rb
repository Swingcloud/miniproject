class MusicsController < ApplicationController

	def index
		@musics= Music.all
	end

	def new	
		@music= Music.new
	end

	def create
		@music = Music.new(params_approve)
		@music.save
		redirect_to musics_path
		
	end

	private 

	def params_approve
		params.require(:music).permit(:name, :compositor, :symphony, :year, :introduction)
	end
end
