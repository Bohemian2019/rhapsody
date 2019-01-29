require 'open-uri'
############### Album seed data ##############

def save_image(url)
  fileName = File.basename(url) + '.jpg'
  dirName = '/vagrant/wcp/rhapsody/app/assets/images/'
  filePath = dirName + fileName

  open(url) do |file|
    open(filePath, "w+b") do |output|
      output.write(file.read)
    end
  end
end


# Artist seed data
mr_children = RSpotify::Artist.search('Mr.Children', market: 'jp').first
queen = RSpotify::Artist.search('Queen', market: 'us').first
robert_glasper = RSpotify::Artist.search('Robert Glasper', market: 'us').first
led_zeppelin = RSpotify::Artist.search('Led Zeppelin', market: 'us').first
rolling_stones = RSpotify::Artist.search('Rolling Stones', market: 'us').first
kendrick_lamar = RSpotify::Artist.search('Kendrick Lamar', market: 'us').first


Artist.create(
  [
    {artist_name: mr_children.name},
    {artist_name: queen.name},
    {artist_name: robert_glasper.name},
    {artist_name: led_zeppelin.name},
    {artist_name: rolling_stones.name},
    {artist_name: kendrick_lamar},
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

# Item Song data
queen.albums.each do |album|
  image_url = p album.images.second["url"]
  save_image(image_url)
  image_url.slice!("https://i.scdn.co/image/")
  Item.create(
    artist_id: Artist.find_by(artist_name: queen.name).id,
    item_name: album.name,
    price: rand(1000) + 1000,
    label_id: 3,
    genre: queen.genres.first,
    stock: rand(100) + 100,
    item_image: image_url + '.jpg'
  )

  tracks = album.tracks
  tracks.each do |track|
    Song.create(
      #item_id: Item.find_by(item_name: album.name).id,
      item_id: Item.last.id,
      disc_number: track.disc_number,
      song_number: track.track_number,
      name: track.name,
      preview_url: track.preview_url
    )
  end
end

