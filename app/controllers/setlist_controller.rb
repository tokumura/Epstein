class SetlistController < ApplicationController

  def index
    @musics = Music.all
    @setlist = Setlist.new
    respond_to do |format|
      format.html # index.html.erb
    end
  end

  def make
    respond_to do |format|
      format.html # index.html.erb
    end
  end


end
