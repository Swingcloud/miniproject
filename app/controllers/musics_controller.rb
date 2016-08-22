class MusicsController < ApplicationController

	before_action :set_music, :only => [:show, :edit, :update, :destroy ]

	def index
		if params[:id]
			@music =Music.find(params[:id])
		else
			@music= Music.new
		end
		@musics= Music.page(params[:page]).per(10)
		respond_to do |format|
    	format.html # index.html.erb
    	format.xml { render :xml => @musics.to_xml }
    	format.json { render :json => @musics.to_json }
    	format.atom { @feed_title = "My Music list" } # index.atom.builder
  	end
	end

	def new	
		@music= Music.new
	end

	def create
		@music = Music.new(params_approve)
		if @music.save
		redirect_to music_path(@music)
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
		
		flash[:notice] = "刪除成功"
		redirect_to musics_path(:page => params[:page])
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
