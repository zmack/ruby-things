require 'minitest/unit'
require 'minitest/autorun'
require_relative '../player.rb'

class FancyPlaylistTest < MiniTest::Unit::TestCase
  def setup
    @playlist = FancyPlaylist.new
  end

  def test_lets_me_add_a_song
    assert @playlist.respond_to? :add_song
  end
end

class FancyPlaylistWithASongTest < FancyPlaylistTest
  def setup
    super
    @playlist.add_song({ 'artist' => 'U2', 'title' => 'Some tired song' })
  end

  def test_returns_the_number_of_songs
    assert_equal 1, @playlist.size
  end

  def test_returns_songs_by_an_artist
    assert_equal 1, @playlist.find_by_artist('U2').length
  end

  def test_returns_songs_matching_a_regex
    assert_equal 0, @playlist.songs_matching(/foo/).length
    assert_equal 1, @playlist.songs_matching(/tired/).length
  end

  def test_can_find_by_artist_and_name
    assert_equal 1, @playlist.find_by_artist('U2').length
    assert_equal 1, @playlist.find_by_title('Some tired song').length
    assert_equal 0, @playlist.find_by_artist('Rednex').length
    assert_equal 0, @playlist.find_by_title('That other song').length
  end

  def test_can_find_by_arbitrary_fields
    @playlist.add_song({ 'artist' => 'Green Day',
                         'title' => 'The one that sounds like that other one',
                         'bitrate' => '192' })
    assert_respond_to @playlist, :find_by_artist
    assert_respond_to @playlist, :find_by_bitrate
    assert_equal 1, @playlist.find_by_bitrate(192).length
  end

  def test_can_iterate_through_songs
    assert_equal 1, @playlist.size
    size = 0
    @playlist.each { size += 1 }
    assert_equal 1, size
  end

  def test_can_map_over_songs
    assert_equal ['U2'], @playlist.map { |s| s.artist }
  end
end
