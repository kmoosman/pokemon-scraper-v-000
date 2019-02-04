require "pry"

class Pokemon
  attr_accessor :id, :name, :type, :db, :hp
  @@all = []

  def initialize(id:, name:, type:, hp:, db:)
    @id = id
    @name = name
    @type = type
    @db = db
    @hp = hp
    @@all << self
  end

  def self.save(name, type, database_connection)
    database_connection.execute("INSERT INTO pokemon (name, hp, type) VALUES (?,?, ?)",name, hp, type)

  end

  def self.find(id, database_connection)
    pokemon = database_connection.execute("SELECT * FROM pokemon WHERE id = ?", id).flatten
    name = pokemon[1]
    hp = pokemon[2]
    type = pokemon[3]


    new_poke = Pokemon.new(id: id, name: name, hp: hp, type: type, db: database_connection)

  end

end
