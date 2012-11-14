class SetlistController < ApplicationController

  def index
    @musics = Music.all
    @setlist = Setlist.new
    conditions = {:number_of_songs => '10', :number_of_george => '0', :number_of_ringo => '0'}
    @setlist = @setlist.set_conditions(conditions)
    respond_to do |format|
      format.html # index.html.erb
    end
  end

  def make
    @musics = Music.all
    @setlist = Setlist.new
    conditions = params[:setlist]
    @setlist = @setlist.set_conditions(conditions)
    respond_to do |format|
      format.html # make.html.erb
    end
  end

end
