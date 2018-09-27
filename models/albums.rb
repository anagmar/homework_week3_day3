require_relative('../db/sql_runner.rb')

class Album

attr_reader :id, :artist_id
attr_accessor :title, :genre

  def initialize(options)
   @id = options['id'].to_i()
   @artist_id = options['artist_id'].to_i()
   @title = options['title']
   @genre = options['genre']
  end

def artist()
 sql = "SELECT * FROM artists
        WHERE id = $1;"

 values = [
   @artist_id
 ]

 result = SqlRunner.run(sql, values)
 artist_hash = result[0]
 artists = Artist.new(artist_hash)

 return artists

end


  def Album.delete_all()
    sql = "DELETE FROM albums;"
    SqlRunner.run(sql)
  end


  def save()
    sql = "INSERT INTO albums (
    artist_id,
    title,
    genre
    )
    VALUES($1, $2, $3)
    RETURNING id;
    "
    values = [
      @artist_id,
      @title,
      @genre
    ]

    result = SqlRunner.run(sql, values)
    @id = result[0]['id'].to_i()

  end

  def Album.all()
      sql = "SELECT * FROM albums;"

      hashes_albums = SqlRunner.run(sql)
      objects_albums = hashes_albums.map do |albums|
        Album.new(albums)
      end

    return objects_albums

  end



end
