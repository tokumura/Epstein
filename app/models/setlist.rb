class Setlist < ActiveRecord::Base
  attr_accessible :number_of_songs, :number_of_george, :number_of_ringo

  def set_conditions(conditions)
    @setlist = Setlist.new
    @setlist.number_of_songs = conditions[:number_of_songs]
    @setlist.number_of_george = conditions[:number_of_george]
    @setlist.number_of_ringo = conditions[:number_of_ringo]
    @setlist
  end
end
