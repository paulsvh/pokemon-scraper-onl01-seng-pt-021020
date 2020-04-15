class Pokemon
attr_accessor :name, :type, :db
attr_reader :id


  def initialize(id:, name:, type:, db:)
    @id = id
    @name = name
    @type = type
    @db = db
  end

  def self.save(name, type, db)
    db.execute("insert into pokemon (name, type) values (?, ?)", name, type)
  end

  def self.find(id, db)
    poke = db.execute("select * from pokemon where id = ?", id)
    found_poke = self.new(id: poke[0], name: poke[1], type: poke[2], db: db)

  end
end
