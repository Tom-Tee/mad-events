class Speaker
  attr_reader :name
  attr_accessor :id

  def initialize(hash = {})
    @name = hash[:name]
    @id = hash[:id]
  end
end
