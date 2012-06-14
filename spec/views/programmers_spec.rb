require './views/programmers'

describe Programmers do
  it 'will render an empty set of programmers' do
    Programmers.new.render.should == '0 rows in set'
  end
end
