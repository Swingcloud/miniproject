class MusicsController < ApplicationController

	before_action :set_music, :only => [:show, :edit, :update, :destroy ]

	def index
		@musics= Music.page(params[:page]).per(10)
	end

	def new	
		@music= Music.new
	end

	def create
		@music = Music.new(params_approve)
		if @music.save
		redirect_to @music,:page => params[:page]
		flash[:notice] = "新增成功"
		else
		render :action => :new 
		end
	end

	def show

		
		@page_title = @music.name
	end

	def edit
		
	end

	def update
		if @music.update( params_approve)
		flash[:notice] = "編輯成功"
		redirect_to music_path
		else
			render :action => :edit #edit.html.erb
		end
	end

	def destroy
		
		@music.destroy
		@music = Music.page(params[:page])
		flash[:notice] = "刪除成功"
		redirect_to musics_path
		# redirect_to :back
		# 壞掉待確認redirect_to  Music.page(:page =>params[:page])
		# respond_to do |d|
		# 	d.html {redirect_to :back}
		# end
	end


	private 

	def params_approve
		params.require(:music).permit(:name, :compositor, :symphony, :year, :introduction)
	end

	def set_music
		@music = Music.find(params[:id])	
	end

end
