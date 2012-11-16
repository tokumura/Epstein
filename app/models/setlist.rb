class Setlist < ActiveRecord::Base
  attr_accessible :number_of_songs, :number_of_george, :number_of_ringo

  def set_conditions(conditions)
    @setlist = Setlist.new
    @setlist.number_of_songs = conditions[:number_of_songs]
    @setlist.number_of_george = conditions[:number_of_george]
    @setlist.number_of_ringo = conditions[:number_of_ringo]
    @setlist
  end

  def shuffle(conditions)
    num_songs = conditions.number_of_songs.to_i
    num_george = conditions.number_of_george.to_i
    num_ringo = conditions.number_of_ringo.to_i

    george_all = Music.find_all_by_vocal('George')
    @george = george_all.to_a.sample(num_george)

    ringo_all = Music.find_all_by_vocal('Ringo')
    @ringo= ringo_all.to_a.sample(num_ringo)

    other_all = Music.where('vocal != ? AND vocal != ?', 'George', 'Ringo')
    if num_songs < (num_george + num_ringo)
      num_songs = num_george + num_ringo
    end
    @other = other_all.to_a.sample(num_songs - (num_george + num_ringo))

    @shuffled = @other.concat(@george.concat(@ringo))
    @shuffled = @shuffled.to_a.sample(num_songs)
  end
end
