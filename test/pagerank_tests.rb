require './pagerank'
require './programmer'
require 'test/unit'

class PageRankTests < Test::Unit::TestCase
    
    def test_simplest_graph()
        programmer_a = Programmer.new 'a', [], ['b']
        programmer_b = Programmer.new 'b', [], ['a']

        programmers = Programmers.new [programmer_a, programmer_b]

        calculator = PageRankCalculator.new programmers

        pagerank = calculator.calculate_pagerank 

        assert_equal(1, programmer_a.kudos)
        assert_equal(1, programmer_b.kudos)
    end
    
end
