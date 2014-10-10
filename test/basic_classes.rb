require_relative 'test_deps'

class Song

end


# We're building the class for a basic song
#
class ClassBasicsTest < MiniTest::Unit::TestCase
  def test_the_class_exists
    assert defined?(Song), "The song class needs to be defined"
  end

  def test_class_has_an_initializer_that_takes_an_artist_name_and_a_song_title
    artist_name = "The Herbalizer"
    title = "There Were Seven"

    Song.new(artist_name, title)
  end

  def test_has_getters_for_artist_name_and_song_title
    song = Song.new("Radiohead", "Supercollider")

    assert_equal "Radiohead", song.artist_name
    assert_equal "Supercollider", song.title
  end

  def test_song_has_an_optional_rating
    song = Song.new("The Glitch Mob", "Fortune Days")

    assert_equal nil, song.rating

    song = Song.new("The Glitch Mob", "Fortune Days", 5)

    assert_equal 5, song.rating
  end

  def test_song_rating_can_be_set_after_creation
    song = Song.new("Holy Fuck", "Casio Bossa Nova")

    assert_equal nil, song.rating

    song.rating = 5

    assert_equal 5, song.rating
  end

  def test_song_defines_a_pretty_format
    song = Song.new("Max Romeo & The Upsetters", "Chase The Devil")

    assert_equal "Max Romeo & The Upsetters - Chase The Devil", song.pretty_format
  end

  def test_song_defines_a_created_at_timestamp
    song = Song.new("Yppah", "Again With The Subtitles")

    assert_equal Time.now.to_i, song.created_at.to_i
  end

  def test_song_defines_an_updated_at_field_that_gets_updated_when_things_change
    song = Song.new("Deadmau5", "Hi Friend!")

    assert_equal song.created_at.to_f, song.updated_at.to_f

    song.rating = 5
    
    refute_equal song.created_at.to_f, song.updated_at.to_f
  end
end
