

# ruby-things

A collection of Ruby learning exercises, koans, and small projects designed to explore core language features, object-oriented programming, blocks, and testing idioms.

## Description

This repository serves as a practical playground for mastering Ruby. It contains:
- **Ko`koans/`**: Self-paced exercises covering arrays, hashes, blocks, inheritance, exceptions, and control statements.
- **`test/`**: Minitest suites for validating implementations of arrays, classes, blocks, hashes, and utility scripts.
- **`player/`**: A modular music player implementing `Song`, `Playlist`, and `UniquePlaylist` classes with corresponding tests.
- **Learning Scripts**: Standalone examples (`blocks.rb`, `classes-1.rb` through `classes-10.rb`, `catch.rb`) demonstrating Ruby syntax, closures, accessors, visibility, and `catch/throw` mechanics.

## Installation

Requirements:
- Ruby 2.5+ or Ruby 3.x
- `minitest` gem

Install dependencies and clone the repository:
```bash
git clone https://github.com/zmack/ruby-things.git
cd ruby-things
gem install minitest
```

## Usage

### Running Tests
All test files are written in Minitest and can be executed directly with Ruby:
```bash
ruby test/array_test.rb
ruby test/basic_blocks.rb
ruby test/classes_test.rb
ruby test/test_deps.rb
```

### Exploring Koans
The koans directory contains interactive learning exercises. Run them individually or use the provided autotest script:
```bash
ruby koans/about_asserts.rb
ruby koans/about_arrays.rb
# Run via autotest (requires autotest gem)
ruby koans/autotest/rubykoan.rb
```

### Executing Learning Scripts
Run the standalone Ruby scripts to observe features in action:
```bash
ruby blocks.rb
ruby classes-10.rb
ruby catch.rb
```

### Player Module
The `player` module can be loaded directly or its tests can be run:
```bash
ruby player/test/playlist_test.rb
ruby player/test/song_test.rb
ruby player/test/unique_playlist_test.rb
```
