class MusicsController < ApplicationController

	def index
		@musics= Music.page(params[:page]).per(10)
	end

	def new	
		@music= Music.new
	end

	def create
		@music = Music.new(params_approve)
		@music.save
		redirect_to @music,:page => params[:page]
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

	def destroy
		@music = Music.find(params[:id])
		@music.destroy
		@music = Music.page(params[:page])
		# 壞掉待確認redirect_to musics_path(@music)
		redirect_to :back
		# 壞掉待確認redirect_to  Music.page(:page =>params[:page])
		# respond_to do |d|
		# 	d.html {redirect_to :back}
		# end
	end


	private 

	def params_approve
		params.require(:music).permit(:name, :compositor, :symphony, :year, :introduction)
	end
end
