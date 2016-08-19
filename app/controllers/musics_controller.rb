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

	def show
		@music = Music.find(params[:id])
	end

	def edit
		@music = Music.find(params[:id])
	end

	def update
		@music = Music.find(params[:id])
		@music.update( params_approve)
		# flash[:notice] = "編輯成功"
		redirect_to music_path(@music) 
	end

	private 

	def params_approve
		params.require(:music).permit(:name, :compositor, :symphony, :year, :introduction)
	end
end
