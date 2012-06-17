require './pagerank'
require './programmer'
require 'test/unit'

class PageRankTests < Test::Unit::TestCase
    
    def test_simplest_graph()
        programmer_a = Programmer.new 'a', [], ['b']
        programmer_b = Programmer.new 'b', [], ['a']

        programmers = Programmers.new [programmer_a, programmer_b]

        calculator = PageRankCalculator.new programmers

        calculator.calculate_pagerank 

        assert_equal(1, programmer_a.kudos)
        assert_equal(1, programmer_b.kudos)
    end
    
    def test_larger_graph()
        programmer_a = Programmer.new 'a', [], ['b', 'c']
        programmer_b = Programmer.new 'b', [], ['c']
        programmer_c = Programmer.new 'c', [], ['a']
        programmer_d = Programmer.new 'd', [], ['c']

        programmers = Programmers.new [programmer_a, programmer_b, programmer_c, programmer_d]

        calculator = PageRankCalculator.new programmers

        calculator.calculate_pagerank

        assert_equal(1.49, programmer_a.kudos.round(2))
        assert_equal(0.78, programmer_b.kudos.round(2))
        assert_equal(1.58, programmer_c.kudos.round(2))
        assert_equal(0.15, programmer_d.kudos.round(2))
    end
end
