class BusStop
  attr_reader(:name, :queue)

  def initialize(name)
    @name = name
    @queue = []
  end

  def add_person_to_queue(person)
    @queue << person
  end
  def empty_queue()
    @queue = []
  end
end
