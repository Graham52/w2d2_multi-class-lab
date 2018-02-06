class Bus
  attr_reader(:route_number, :destination)

  def initialize(route_number, destination)
    @route_number = route_number
    @destination = destination
    @passengers = []
  end

  def drive()
    return "Brum brum"
  end

  def count_passengers()
    return @passengers.length()
  end

  def pick_up_passenger(person)
    @passengers << person
  end

  def drop_off_passenger(person)
    @passengers.delete(person)
    # for passenger in @passengers
    #   @passengers.delete(passenger) if passenger == person
    # end
  end

  def empty_all_passengers()
    @passengers = []
  end

  def pick_up_from_stop(bus_stop)
    for person in bus_stop.queue
      pick_up_passenger(person)
    end
    bus_stop.empty_queue
  end
end
