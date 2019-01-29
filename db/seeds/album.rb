# Setting for spotify-api authentication
require 'rspotify'
require 'dotenv'
Dotenv.load
RSpotify.authenticate(ENV["SPOTIFY_CLIENT_ID"], ENV["SPOTIFY_CLIENT_SECRET"])

require 'open-uri'
############### Album seed data ##############

def save_image(url)
  fileName = File.basename(url) + '.jpg'
  dirName = '/vagrant/wcp/rhapsody/app/assets/images/'
  filePath = dirName + fileName

  open(url) do |file|
    open(filePath, "wb") do |output|
      output.write(file.read)
    end
  end
end


# Artist seed data
mr_children = RSpotify::Artist.search('Mr.Children', limit: 2, market: 'jp').first
queen = RSpotify::Artist.search('Queen', limit: 1, market: 'us').first
robert_glasper = RSpotify::Artist.search('Robert Glasper', limit: 3, market: 'us').first
anderson_paak= RSpotify::Artist.search('Anderson Paak', limit: 2, market: 'us').first
radiohead  = RSpotify::Artist.search('Radiohead', limit: 1, market: 'us').first
imagine_dragons = RSpotify::Artist.search('Imagine Dragons', limit: 1, market: 'us').first
bruno_mars = RSpotify::Artist.search('Bruno Mars', limit: 1, market: 'us').first

=begin
Artist.create(
  [
    {artist_name: mr_children.name},
    {artist_name: robert_glasper.name},
    {artist_name: queen.name},
    {artist_name: anderson_paak.name},
    {artist_name: radiohead.name},
    {artist_name: imagine_dragons.name},
    {artist_name: bruno_mars.name},
  ]
)


# Label data
Label.create(
  [
    {:label_name => 'Infratop'},
    {:label_name => 'Bluenote'},
    {:label_name => 'Atlantic record'},
    {:label_name => 'Universal Music'}
  ]
)
=end

# Item Song data
artist = bruno_mars

artist.albums.each do |album|
  image_url = p album.images.second["url"]
  save_image(image_url)
  image_url.slice!("https://i.scdn.co/image/")

  if !Item.exists?(item_name: album.name)
    Item.create(
      artist_id: Artist.find_by(artist_name: artist.name).id,
      item_name: album.name,
      price: rand(1000) + 1000,
      label_id: 3,
      genre: artist.genres.first,
      stock: rand(100) + 100,
      item_image: image_url +  '.jpg'
    )
    sleep(0.1)

    tracks = album.tracks
    tracks.each do |track|
      Song.create(
        item_id: Item.find_by(item_name: album.name).id,
        disc_number: track.disc_number,
        song_number: track.track_number,
        name: track.name,
        preview_url: track.preview_url
      )
    end
    sleep(1)
  end
end
