require("minitest/autorun")
require_relative("../person.rb")

class TestPerson < MiniTest::Test
  def setup()
    @person = Person.new("Graham", 32)
  end

  def test_person_has_name()
    assert_equal("Graham",@person.name)
  end

  def test_person_has_age()
    assert_equal(32, @person.age)
  end
end
