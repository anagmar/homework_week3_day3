DROP TABLE IF EXISTS artists;
DROP TABLE IF EXISTS albums;


CREATE TABLE artists (
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255)
);

CREATE TABLE albums (
  id SERIAL8 PRIMARY KEY,
  artist_id INT8 REFERENCES artists(id),
  title VARCHAR(255),
  genre VARCHAR(255)
);

SELECT * FROM artists;
SELECT * FROM albums;
