require_relative('./models/artists.rb')
require_relative('./models/albums.rb')
require('pry')

Album.delete_all()
Artist.delete_all()


artist1 = Artist.new({
  'name' => 'Arcade Fire'
  })

artist2 = Artist.new({
  'name' => 'Radiohead'
  })

artist1.save()
artist2.save()

artists = Artist.all()

album1 = Album.new({
  'artist_id' => artist1.id,
  'title' => 'The Suburbs',
  'genre' => 'Indie'
  })

album2 = Album.new({
  'artist_id' => artist1.id,
  'title' => 'Everything Now',
  'genre' => 'Dream Pop / Disco'
  })

album3 = Album.new({
  'artist_id' => artist2.id,
  'title' => 'In Rainbows',
  'gendre' => 'Art Rock'
  })

album1.save()
album2.save()
album3.save()

binding.pry
