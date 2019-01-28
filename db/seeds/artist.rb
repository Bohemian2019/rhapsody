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
