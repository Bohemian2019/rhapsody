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
queen = RSpotify::Artist.search('Queen').first
robert_glasper = RSpotify::Artist.search('Robert Glasper').first
led_zeppelin = RSpotify::Artist.search('Led Zeppelin').first
rolling_stones = RSpotify::Artist.search('Rolling Stones').first
kendrick_lamar = RSpotify::Artist.search('Kendrick Lamar').first


Artist.create(
  [
    {artist_name: mr_children.name},
    {artist_name: queen.name},
    {artist_name: robert_glasper.name},
    {artist_name: led_zeppelin.name},
    {artist_name: rolling_stones.name},
    {artist_name: kendrick_lamar.name},
  ]
)


# Label data
Label.create(
  [
    {:label_name => 'Infratop'},
    {:label_name => 'Bluenote'},
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

  tracks = RSpotify::Track.search(album.name)
  tracks.each.with_index do |track, i|
    Song.create(
      item_id: Item.find_by(item_name: album.name).id,
      disc_number: 1,
      song_number: i+1,
      name: track.name,
    )
  end
end

