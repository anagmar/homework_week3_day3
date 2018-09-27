require_relative('../db/sql_runner.rb')

class Artist

attr_reader :id
attr_accessor :name

  def initialize(options)
    @id = options['id'].to_i
    @name = options['name']
  end

  def albums()
  sql = "SELECT * FROM albums
  WHERE artist_id = $1;"

  values = [
    @id
  ]
  result = SqlRunner.run(sql, values)
  albums = result.map do |albums_hash|
  Album.new(albums_hash)
    end

    return albums

  end

  def Artist.delete_all()

    sql = "DELETE FROM artists;"

    SqlRunner.run(sql)

  end



  def save()
    sql = "
    INSERT INTO artists(
      name
    )
    VALUES($1)
    RETURNING id;
    "
    values = [
      @name
    ]

    result = SqlRunner.run(sql, values)

    @id = result[0]['id'].to_i()
  end

  def Artist.all()

    sql = "SELECT * FROM artists;"

    artists_hash = SqlRunner.run(sql)
    artists_objects = artists_hash.map do |artists|
      Artist.new(artists)
    end

  return artists_objects

  end

  def update()

    sql = "UPDATE aritist
    SET (
      name
    ) = ($1)
    WHERE id = $2;
    "

    values = [
      @name
    ]

   SqlRunner.run(sql, values)

  end

end
