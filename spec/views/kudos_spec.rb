require './spec/spec_helper'

require './programmer'
require './views/kudos'

describe Kudos do
  it 'displays nothing for no programmers' do
    Kudos.new([]).render.should == the_table('
      0 rows in set
    ')
  end

  it 'displays a list of programmers names listed by their kudos in descending order' do
    programmers = [Programmer.new('A', [], ['B']), Programmer.new('B', [], ['A'])]
    relationships = programmers.collect { |programmer| ProgrammerWithRelationships.new(programmer, programmers) }
    kudos = relationships.zip([1, 2]).collect { |programmer, kudos| ProgrammerWithKudos.new(programmer, kudos) }
    Kudos.new(kudos).render.should == the_table('
      +------+-------+
      | name | kudos |
      +------+-------+
      | B    | 2     |
      | A    | 1     |
      +------+-------+
      2 rows in set
    ')
  end
end
