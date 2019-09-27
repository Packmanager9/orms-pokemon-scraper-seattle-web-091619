class Pokemon
    attr_accessor :name, :type, :db, :id
    def initialize (params = {id: id = nil, name: name, type: type,  db: @db})
        @id = params[:id]
            @name = params[:name]
            @type = params[:type]
            @db = params[:db]
    end
    def create_table
        sql = "CREATE TABLE pokemon (id INTEGER PRIMARY KEY, name TEXT, type TEXT)"
        @db[:conn].execute(sql)
    end
    def self.save(name, type, db)
            sql = "INSERT INTO pokemon (name, type) VALUES(?, ?)"
            # @id = @db.execute("SELECT last_insert_rowid() FROM pokemon")[0][0]
            db.execute(sql, name, type)
    end
    def self.find(id, db)
        sql = "SELECT * FROM pokemon WHERE id = 1 "
        pokemonster = db.execute(sql)
        puts pokemonster
        hash = {}
        hash["id"] = 1
        hash["name"] = pokemonster[1]
        hash["type"] = pokemonster[2]
        hash["db"] = db


        pikachu = Pokemon.new(hash)
        
        pikachu.id = pokemonster[0][0]
        pikachu.name = pokemonster[0][1]
        pikachu.type = pokemonster[0][2]
        puts pikachu
        puts pikachu.id
        puts pikachu.name
        pikachu
     end
 end
 
 

 
 
 