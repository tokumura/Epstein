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

    first_songs = Music.where('vocal != ? AND vocal != ? AND first = ?', 'George', 'Ringo', 't')
    @first = first_songs.to_a.sample(1)

    last_songs = Music.where('vocal != ? AND vocal != ? AND last = ?', 'George', 'Ringo', 't')
    @last = last_songs.to_a.sample(1)

    other_all = Music.where('vocal != ? AND vocal != ? AND title != ? AND title != ?',
                            'George', 'Ringo', @first[0].title, @last[0].title)

    if num_songs < (num_george + num_ringo)
      num_songs = num_george + num_ringo
    end

    num_other = num_songs - (num_george + num_ringo + 2) # '2'=(first+last)
    if num_other < 0
      num_other = 0
    end
    @other = other_all.to_a.sample(num_other)
    @shuffled = @other.concat(@george.concat(@ringo))
    @shuffled = @shuffled.to_a.sample(num_songs)
    if @shuffled.size < 10
      @shuffled.insert(0, @first[0])
    end
    if @shuffled.size < 10
      @shuffled = @shuffled.concat(@last)
    end
    @shuffled
  end
end
