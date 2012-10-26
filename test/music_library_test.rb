require 'minitest/unit'
require 'minitest/autorun'
require_relative '../music_library.rb'

class MusicLibraryTest < MiniTest::Unit::TestCase
  def setup
    @library = MusicLibrary.new
  end

  def test_lets_me_add_a_song
    assert @library.respond_to? :add_song
  end
end

class MusicLibraryWithASongTest < MusicLibraryTest
  def setup
    super
    @library.add_song({ :artist => 'U2', :name => 'Some tired song' })
  end

  def test_returns_the_number_of_songs
    assert_equal 1, @library.size
  end

  def test_returns_songs_by_an_artist
    assert_equal 1, @library.songs_by_artist('U2').length
  end

  def test_returns_songs_matching_a_regex
    assert_equal 0, @library.songs_matching(/foo/).length
    assert_equal 1, @library.songs_matching(/tired/).length
  end

  def test_can_find_by_artist_and_name
    assert_equal 1, @library.find_by_artist('U2').length
    assert_equal 1, @library.find_by_name('Some tired song').length
    assert_equal 0, @library.find_by_artist('Rednex').length
    assert_equal 0, @library.find_by_name('That other song').length
  end

  def test_can_find_by_arbitrary_fields
    assert @library.respond_to? :find_by_artist
    assert !@library.respond_to?(:find_by_bitrate)
    @library.add_song({ :artist => 'Green Day',
                        :name => 'The one that sounds like that other one',
                        :bitrate => 192 })
    assert @library.respond_to?(:find_by_bitrate)
  end

  def test_can_iterate_through_songs
    assert_equal 1, @library.size
    size = 0
    @library.each { size += 1 }
    assert_equal 1, size
  end

  def test_can_map_over_songs
    assert_equal ['U2'], @library.map { |s| s[:artist] }
  end
end
