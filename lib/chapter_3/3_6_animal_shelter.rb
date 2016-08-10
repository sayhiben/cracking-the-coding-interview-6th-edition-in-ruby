# 3.6 Animal Shelter
# An animal shelter, which holds only dogs and cats, operates on a strictly
#   "first in, first out" basis. People must adopt either the "oldest" (based
#   on arrival time) of all animals at the shelter, or they can select whether
#   they would prefer a dog or a cat (and will receive the oldest animal of that
#   type). They cannot select which specific animal they would like. Create the
#   data structures to maintain this system and implement operations such as
#   enqueue, dequeue_any, dequeue_dog, and dequeue_cat. You may use a
#   LinkedList data structure
#

# Discussion:
#   The key to this problem is storing additional data with the animal records.
#   If we maintain two queues - one each for dogs and cats - we must be able to
#   decide which animal is oldest between the two heads of the queues. To do
#   this, we can create an "AnimalRecord" object that tracks an id or timestamp
#   alongside the type of animal (and, in the real world, any additional
#   information about the animal)
#
require './lib/util/linked_list.rb'
include Util

# Basic record class to hold data
class AnimalRecord
  attr_reader :id, :type, :name
  def initialize(id, type, name)
    @id = id
    @name = name
    @type = type
  end
end

# Implements a queue from LinkedList
class Queue
  attr_accessor :head, :tail

  def initialize
    @list = LinkedList.new
  end

  def enqueue(item)
    node = LinkedList::Node.new(item)
    @head = node if @head.nil?
    @tail.next = node unless @tail.nil?
    @tail = node
  end

  def dequeue
    tmp = @head
    @head = @head.next unless @head.nil?
    @tail = nil if @head.nil?
    tmp.data
  end

  def peek
    @head.nil? ? nil : @head.data
  end

  def empty?
    @head.nil?
  end
end

# Manages multiple queues of animals
class AnimalShelter
  VALID_ANIMAL_TYPES = %w(dog cat)

  def initialize
    @next_id = 0
    @dog_queue = Queue.new
    @cat_queue = Queue.new
  end

  def enqueue(options = {})
    raise ArgumentError unless VALID_ANIMAL_TYPES.include? options[:type]
    animal = AnimalRecord.new(@next_id, options[:type], options[:name])
    @next_id += 1

    queue = options[:type] == 'dog' ? @dog_queue : @cat_queue
    queue.enqueue(animal)
  end

  # Returns the next animal with the lowest id
  def dequeue_any
    return nil if @dog_queue.empty? && @cat_queue.empty?
    if @dog_queue.empty? || @cat_queue.peek.id < @dog_queue.peek.id
      @cat_queue.dequeue
    elsif @cat_queue.empty? || @dog_queue.peek.id < @cat_queue.peek.id
      @dog_queue.dequeue
    end
  end

  def dequeue_dog
    @dog_queue.dequeue
  end

  def dequeue_cat
    @cat_queue.dequeue
  end
end
