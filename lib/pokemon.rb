class Pokemon

  attr_accessor :id, :name, :type, :db
  @@all = []

  def initialize(id:, name:, type:, db: nil)
    @id = id
    @name = name
    @type = type
    @db = db
    @@all << self
  end

  def self.all
    @@all
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
  end

  def self.find(id, db)
    #db.execute("SELECT * FROM pokemon WHERE id = (?)", id)
    poke_row = db.execute("SELECT * FROM pokemon WHERE id = ?", id)
    row = poke_row.first
    Pokemon.new(id: row[0], name: row[1], type: row[2])
  end

end#end of class
