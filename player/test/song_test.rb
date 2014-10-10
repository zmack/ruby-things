require 'minitest/unit'
require 'minitest/autorun'
require_relative "../player"

class SongTest < MiniTest::Unit::TestCase
  def test_there_is_a_song_class
    assert_kind_of Class, Song
  end

  def test_a_song_has_a_title_and_an_artist
    song = Song.new
    assert_respond_to song, :title
    assert_respond_to song, :artist
  end

  def test_a_new_song_can_be_initialized_to_a_title_and_artist
    song = Song.new({ 'title' => "Hey Guy", 'artist' => "This Girl" })
    assert_equal "Hey Guy", song.title
    assert_equal "This Girl", song.artist
  end

  def test_a_song_can_get_pretty_printed
    song = Song.new({ 'title' => "Hey Guy", 'artist' => "This Girl" })
    assert_equal "This Girl - Hey Guy", song.to_s
  end

  def test_a_song_can_also_take_a_length
    song = Song.new({ 'title' => "Hey Guy", 'artist' => "This Girl", 'length' => "128" })
    assert_equal 128, song.length
  end

  def test_a_song_should_be_able_to_print_song_duration_in_time_format
    song = Song.new({ 'title' => "Hey Guy", 'artist' => "This Girl", 'length' => "128" })
    assert_equal "2:08", song.duration
  end

  def test_a_song_should_be_able_to_pretty_print_the_duration_as_well
    song = Song.new({ 'title' => "Hey Guy", 'artist' => "This Girl", 'length' => "128" })
    assert_equal "This Girl - Hey Guy [2:08]", song.to_s
  end

  def test_songs_with_the_same_details_are_equal
    song = Song.new({ 'title' => "Hey Guy", 'artist' => "This Girl", 'length' => "128" })
    other_song = Song.new({ 'title' => "Hey Guy", 'artist' => "This Girl", 'length' => "128" })
    assert_equal song, other_song
  end
end

