require './programmer'
require './views/programmers'

describe Programmers do
  it 'will render an empty set of programmers' do
    Programmers.new([]).render.should == '0 rows in set'
  end

  it 'will render a single programmer in a table' do
    programmers = [Programmer.new('fred', ['Java'], ['bob'])]

    Programmers.new(programmers).render.should == the_table('
      +------+--------+-----------------+
      | name | skills | recommendations |
      +------+--------+-----------------+
      | fred | Java   | bob             |
      +------+--------+-----------------+
      1 row in set
    ')
  end

  it 'will render a single programmer in a table' do
    programmers = [Programmer.new('fred', ['Java'], ['bob']), 
                   Programmer.new('mark', ['python'], ['fred','bob'])]

    Programmers.new(programmers).render.should == the_table('
      +------+--------+-----------------+
      | name | skills | recommendations |
      +------+--------+-----------------+
      | fred | Java   | bob             |
      | mark | python | fred, bob       |
      +------+--------+-----------------+
      2 rows in set
    ')
  end

  def the_table str
    str.strip.gsub /^ {6}/, ''
  end
end
