require "spec_helper"

describe "Associations — Song and Artist:" do
  let(:song) { Song.new("In the Aeroplane Over the Sea") }
  let(:artist) { Artist.new("Neutral Milk Hotel") }

  context "Artist" do
    describe "#initialize" do
      it "creates a 'songs' property set to an empty array (artist has many songs)" do
        expect(artist.instance_variable_defined?(:@songs)).to be(true)
        expect(artist.instance_variable_get(:@songs)).to eq([])
      end
    end

    describe "#songs" do
      it "returns the artist's 'songs' collection (artist has many songs)" do
        expect(artist.songs).to eq([])

        artist.songs << song

        expect(artist.songs).to include(song)
      end
    end
  end

  context "Song" do
    describe "#initialize" do
      it "can be invoked with an optional second argument, an Artist object to be assigned to the song's 'artist' property (song belongs to artist)" do
        song_with_artist = Song.new("Two-Headed Boy", artist)

        expect(song_with_artist.instance_variable_defined?(:@artist)).to be(true)
        expect(song_with_artist.instance_variable_get(:@artist)).to be(artist)
      end
    end

    desc
