class Speaker
  attr_reader :name, :id
  attr_writer :id

  def initialize(hash = {})
    @name = hash[:name]
    @id = hash[:id]
  end
end
