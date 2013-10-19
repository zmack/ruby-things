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
end

class UniquePlaylistTest < MiniTest::Unit::TestCase
  def test_there_is_a_unique_playlist_class
    assert_kind_of Class, UniquePlaylist
  end

  def test_a_unique_playlist_starts_out_with_no_songs
    playlist = UniquePlaylist.new
    assert_equal 0, playlist.songs.count
  end

  def test_a_unique_playlist_can_add_a_song
    playlist = UniquePlaylist.new
    song = Song.new({ 'title' => "Hey Guy", 'artist' => "This Girl", 'length' => "128" })

    playlist.add_song(song)
    assert_equal 1, playlist.songs.count
    assert_equal song, playlist.songs[0]
  end

  def test_a_unique_playlist_can_add_a_song_from_a_hash
    playlist = UniquePlaylist.new
    playlist.add_song({ 'title' => "Hey Guy", 'artist' => "This Girl", 'length' => "128" })
    assert_equal 1, playlist.songs.count

    song = playlist.songs[0]

    assert_kind_of Song, song
    assert_equal 'Hey Guy', song.title
    assert_equal 'This Girl', song.artist
    assert_equal 128, song.length
  end

  def test_a_unique_playlist_can_have_a_fancy_method_to_add_a_song
    playlist = UniquePlaylist.new
    song = Song.new({ 'title' => "Hey Guy", 'artist' => "This Girl", 'length' => "128" })

    playlist << song
    assert_equal 1, playlist.songs.count
    assert_equal song, playlist.songs[0]
  end

  def test_a_unique_playlist_only_adds_a_song_a_single_time
    playlist = UniquePlaylist.new
    song = Song.new({ 'title' => "Hey Guy", 'artist' => "This Girl", 'length' => "128" })
    other_song = Song.new({ 'title' => "Hey Guy", 'artist' => "This Girl", 'length' => "128" })

    playlist << song
    playlist << other_song
    assert_equal 1, playlist.songs.count
    assert_equal song, playlist.songs[0]
  end

  def test_a_unique_playlist_only_adds_a_song_a_single_time_even_when_passed_as_a_hash
    playlist = UniquePlaylist.new
    song = Song.new({ 'title' => "Hey Guy", 'artist' => "This Girl", 'length' => "128" })
    other_song = { 'title' => "Hey Guy", 'artist' => "This Girl", 'length' => "128" }

    playlist << song
    playlist << other_song
    assert_equal 1, playlist.songs.count
    assert_equal song, playlist.songs[0]
  end
end
