class Speaker
  attr_reader :name, :id

  def initialize(hash = {})
    @name = hash[:name]
    @id = hash[:id]
  end
end
