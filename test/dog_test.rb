require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require './lib/dog'

class DogTest < Minitest::Test
  def test_it_exists
    dog = Dog.new({name: 'Salmon', nickname: 'Sam', breed: 'Wirehaired Pointing Griffon'})

    assert_instance_of Dog, dog
  end

  def test_it_has_attributes
    dog_info = {
      name: 'Salmon',
      nickname: 'Sam',
      breed: 'Wirehaired Pointing Griffon'
    }
    dog = Dog.new(dog_info)

    assert_equal 'Salmon', dog.name
    assert_equal 'Sam', dog.nickname
    assert_equal 'Wirehaired Pointing Griffon', dog.breed
  end

  def test_it_starts_with_no_toys
    dog = Dog.new({name: 'Salmon', nickname: 'Sam', breed: 'Wirehaired Pointing Griffon'})

    assert_equal ({}), dog.toys
  end

  def test_it_can_add_toys
    dog = Dog.new({name: 'Salmon', nickname: 'Sam', breed: 'Wirehaired Pointing Griffon'})

    dog.add_toy(:kong, 1)
    dog.add_toy(:chuck_it, 1)
    dog.add_toy(:kong, 2)
    dog.add_toy(:bene_bone, 5)

    assert_equal ({kong: 3, chuck_it: 1, bene_bone: 5}), dog.toys
  end

  def test_it_can_get_toy_names
    dog = Dog.new({name: 'Salmon', nickname: 'Sam', breed: 'Wirehaired Pointing Griffon'})

    dog.add_toy(:kong, 1)
    dog.add_toy(:chuck_it, 1)
    dog.add_toy(:kong, 2)
    dog.add_toy(:bene_bone, 5)

    assert_equal ["kong", "chuck_it", "bene_bone"], dog.toy_names
  end

  def test_it_can_get_toys_that_it_has_more_than_one_of
    dog = Dog.new({name: 'Salmon', nickname: 'Sam', breed: 'Wirehaired Pointing Griffon'})

    dog.add_toy(:kong, 1)
    dog.add_toy(:chuck_it, 1)
    dog.add_toy(:kong, 2)
    dog.add_toy(:bene_bone, 5)

    assert_equal [:kong, :bene_bone], dog.multiples_of_toy
  end
end
