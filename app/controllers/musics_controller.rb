# coding: utf-8
class MusicsController < ApplicationController
  # GET /musics
  def index
    @musics = Music.all
    @music = Music.new

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  # GET /musics/1/edit
  def edit
    @musics = Music.all
    @music = Music.find(params[:id])
  end

  # POST /musics
  def create
    @musics = Music.all
    @music = Music.new(params[:music])
    if @music.save
      flash[:notice] = "曲は追加されました。"
      redirect_to :action => "index"
    else
      render :action => "index"
    end
  end

  # PUT /musics/1
  def update
    @musics = Music.all
    @music = Music.find(params[:id])

    respond_to do |format|
      if @music.update_attributes(params[:music])
        format.html { redirect_to :action => 'index' }
      else
        format.html { render action: "edit" }
      end
    end
  end

  # DELETE /musics/1
  def destroy
    @music = Music.find(params[:id])
    @music.destroy

    respond_to do |format|
      format.html { redirect_to musics_url }
    end
  end
end
