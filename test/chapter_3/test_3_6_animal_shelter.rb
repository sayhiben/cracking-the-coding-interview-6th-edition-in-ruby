require 'test_helper.rb'
require './lib/chapter_3/3_6_animal_shelter.rb'

class TestAnimalShelter < Minitest::Test
  def test_dequeue_any
    shelter = AnimalShelter.new
    shelter.enqueue(type: 'dog', name: 'Leo')
    shelter.enqueue(type: 'cat', name: 'Meow')
    shelter.enqueue(type: 'dog', name: 'Max')
    shelter.enqueue(type: 'cat', name: 'Meowmers')
    animal = shelter.dequeue_any
    assert_equal animal.name, 'Leo'
  end
end
