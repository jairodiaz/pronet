require './programmer'
require 'test/unit'

class ProgrammersTest < Test::Unit::TestCase
    def test_find_programmers_who_recommend_should_return_set_of_programmers_who_recommend()
        jim = Programmer.new('jim', [], [])
        bob = Programmer.new('bob', [], ['jim', 'fred'])
        fred = Programmer.new('fred', [], ['jim'])

        programmers = Programmers.new [jim, bob, fred]

        bobs_recommenders = programmers.find_those_who_recommend(jim)

        assert_equal(2, bobs_recommenders.length)
    end

    def test_find_programmers_who_recommend_should_return_empty_list_for_crap_programmer()
        me = Programmer.new('me', [], [])
        programmers = Programmers.new [me]

        my_recommenders = programmers.find_those_who_recommend(me)

        assert_equal(0, my_recommenders.length)
    end
end
