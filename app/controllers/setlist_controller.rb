class SetlistController < ApplicationController

  def index
    @musics_johnpaul = Music.find_all_by_vocal('John&Paul')
    @musics_john = Music.find_all_by_vocal('John')
    @musics_paul = Music.find_all_by_vocal('Paul')
    @musics_george = Music.find_all_by_vocal('George')
    @musics_ringo = Music.find_all_by_vocal('Ringo')

    @setlist = Setlist.new
    conditions = {:number_of_songs => '10', :number_of_george => '0', :number_of_ringo => '0'}
    @setlist = @setlist.set_conditions(conditions)

    @setlist_shuffled = Array.new

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  def shuffle
    @musics_johnpaul = Music.find_all_by_vocal('John&Paul')
    @musics_john = Music.find_all_by_vocal('John')
    @musics_paul = Music.find_all_by_vocal('Paul')
    @musics_george = Music.find_all_by_vocal('George')
    @musics_ringo = Music.find_all_by_vocal('Ringo')

    @setlist = Setlist.new
    conditions = params[:setlist]
    @setlist = @setlist.set_conditions(conditions)
    @setlist_shuffled = @setlist.shuffle(@setlist)

    respond_to do |format|
      format.html # make.html.erb
    end
  end

end
