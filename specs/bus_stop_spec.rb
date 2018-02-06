require("minitest/autorun")
require_relative("../bus_stop")
require_relative("../person")

class TestBusStop < MiniTest::Test
  def setup()
    @bus_stop = BusStop.new("Ocean Terminal")
    @person = Person.new("Darren", 32)
  end

  def test_bus_stop_has_name()
    assert_equal("Ocean Terminal", @bus_stop.name())
  end

  def test_bus_stop_has_no_queue()
    assert_equal([],@bus_stop.queue())
  end

  def test_bus_stop_add_person_to_queue()
    @bus_stop.add_person_to_queue(@person)
    assert_equal(1,@bus_stop.queue.length())
  end

  def test_bus_stop_remove_from_queue()
    @bus_stop.add_person_to_queue(@person)
    @bus_stop.empty_queue
    assert_equal(0, @bus_stop.queue.length())
  end
end
