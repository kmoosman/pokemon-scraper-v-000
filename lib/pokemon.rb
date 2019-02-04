require "pry"

class Pokemon
  attr_accessor :id, :name, :type, :db, :hp
  @@all = []

  def initialize(id:, name:, type:, db:)
    @id = id
    @name = name
    # @hp = hp
    @type = type
    @db = db

    @@all << self
  end

  def self.save(name, type, database_connection)
    database_connection.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)",name, type)

  end

  def self.find(id, database_connection)
    pokemon = database_connection.execute("SELECT * FROM pokemon WHERE id = ?", id).flatten
    name = pokemon[1]
    type = pokemon[2]


    new_poke = Pokemon.new(id: id, name: name, type: type, db: database_connection)

  end

  # def alter_hp(hp_hit, database_connection)
  #   database_connection.execute("UPDATE pokemon
  #   SET hp = ?
  #   WHERE id = ?", hp_hit, @id)
  # end

  def alter_hp(new_hp, database_connection)
  database_connection.execute("UPDATE pokemon SET hp = ? WHERE id = ?", new_hp, @id)
end


end
