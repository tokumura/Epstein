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
    num_songs_in_setlist= conditions.number_of_songs.to_i
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

    if num_songs_in_setlist < (num_george + num_ringo)
      num_songs_in_setlist = num_george + num_ringo
    end

    @shuffled = Array.new

    num_johnpaul = num_songs_in_setlist - (num_george + num_ringo)

    if num_johnpaul <= 2
      @shuffled = @george.concat(@ringo).to_a.sample(num_songs_in_setlist - num_johnpaul)
      @shuffled = add_first_last(@shuffled, num_johnpaul, @first[0], @last)
    else
      @other = other_all.to_a.sample(num_songs_in_setlist - (num_george + num_ringo + 2))
      @george = @george.to_a.sample(num_george)
      @ringo = @ringo.to_a.sample(num_ringo)
      @shuffled = @other.concat(@george.concat(@ringo))
      @shuffled = @shuffled.to_a.sample(num_songs_in_setlist - 2)
      @shuffled = add_first_last(@shuffled, num_johnpaul, @first[0], @last)
    end
    @shuffled
  end

  def add_first_last(shuffled, num_johnpaul, first, last)
    if num_johnpaul == 1
      shuffled.insert(0, first)
    elsif num_johnpaul >= 2
      shuffled.insert(0, first)
      shuffled = shuffled.concat(last)
    end
    shuffled
  end
end
