require("minitest/autorun")
require_relative("../bus.rb")
require_relative("../person")
require_relative("../bus_stop")

class TestBus < MiniTest::Test
  def setup()
    @bus = Bus.new(22, "Ocean Terminal")
    @person = Person.new("Dan", 30)
    @person1 = Person.new("Alex", 32)
    @person2 = Person.new("Jane", 25)
    @bus_stop = BusStop.new("Princes Street")

  end

  def test_bus_has_route_number()
    assert_equal(22,@bus.route_number)
  end

  def test_bus_has_destination()
    assert_equal("Ocean Terminal", @bus.destination)
  end

  def test_bus_can_drive()
    actual = @bus.drive()
    assert_equal("Brum brum", actual)
  end

  def test_bus_count_passengers()
    assert_equal(0,@bus.count_passengers())
  end

  def test_bus_pick_up_passenger()
    @bus.pick_up_passenger(@person)
    assert_equal(1,@bus.count_passengers())
  end

  def test_bus_drop_off()
    @bus.pick_up_passenger(@person)
    @bus.drop_off_passenger(@person)
    assert_equal(0, @bus.count_passengers())
  end

  def test_bus_drop_off__person_not_found()
    @bus.pick_up_passenger(@person)
    @bus.drop_off_passenger(@person1)
    assert_equal(1, @bus.count_passengers())
  end

  def test_empty_bus()
    @bus.pick_up_passenger(@person)
    @bus.pick_up_passenger(@person1)
    @bus.empty_all_passengers()
    assert_equal(0, @bus.count_passengers())
  end

  def test_pick_up_from_stop__bus_stop_empty()
    @bus_stop.add_person_to_queue(@person)
    @bus_stop.add_person_to_queue(@person1)
    @bus_stop.add_person_to_queue(@person2)
    @bus.pick_up_from_stop(@bus_stop)
    assert_equal(0,@bus_stop.queue.length())
  end

  def test_pick_up_from_stop__bus_has_passengers()
    @bus_stop.add_person_to_queue(@person)
    @bus_stop.add_person_to_queue(@person1)
    @bus_stop.add_person_to_queue(@person2)
    @bus.pick_up_from_stop(@bus_stop)
    assert_equal(3,@bus.count_passengers())
  end
end
