require('pg')


class SqlRunner

  def self.run(sql, values = [])
    #the
    db = PG.connect({
    dbname: 'music_collector',
    host: 'localhost'
     })
     db.prepare('query', sql)
     results = db.exec_prepared('query', values)
     db.close()

     return results 
  end


end
