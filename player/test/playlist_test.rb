require 'minitest/unit'
require 'minitest/autorun'
require_relative "../player"

class PlaylistTest < MiniTest::Unit::TestCase
  def test_there_is_a_playlist_class
    assert_kind_of Class, Playlist
  end

  def test_a_playlist_has_songs
    playlist = Playlist.new
    assert_respond_to playlist, :songs
  end

  def test_a_playlist_starts_out_with_no_songs
    playlist = Playlist.new
    assert_equal 0, playlist.songs.count
  end

  def test_a_playlist_can_add_a_song
    playlist = Playlist.new
    song = Song.new({ 'title' => "Hey Guy", 'artist' => "This Girl", 'length' => "128" })

    playlist.add_song(song)
    assert_equal 1, playlist.songs.count
    assert_equal song, playlist.songs[0]
  end

  def test_a_playlist_can_add_a_song_from_a_hash
    playlist = Playlist.new
    playlist.add_song({ 'title' => "Hey Guy", 'artist' => "This Girl", 'length' => "128" })
    assert_equal 1, playlist.songs.count

    song = playlist.songs[0]

    assert_kind_of Song, song
    assert_equal 'Hey Guy', song.title
    assert_equal 'This Girl', song.artist
    assert_equal 128, song.length
  end

  def test_a_playlist_can_have_a_fancy_method_to_add_a_song
    playlist = Playlist.new
    song = Song.new({ 'title' => "Hey Guy", 'artist' => "This Girl", 'length' => "128" })

    playlist << song
    assert_equal 1, playlist.songs.count
    assert_equal song, playlist.songs[0]
  end

  def test_a_playlist_should_return_the_total_play_time
    playlist = Playlist.new
    song = Song.new({ 'title' => "Hey Guy", 'artist' => "This Girl", 'length' => "128" })
    playlist << song

    song = Song.new({ 'title' => "Hey Guy", 'artist' => "This Girl", 'length' => "128" })
    playlist << song

    assert_equal 2, playlist.songs.count
    assert_equal 256, playlist.length
  end
end
