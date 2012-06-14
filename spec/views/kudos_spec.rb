require './spec/spec_helper'

require './programmer'
require './views/kudos'

describe Kudos do
  it 'displays nothing for no programmers' do
    Kudos.new([]).render.should == the_table('
      0 rows in set
    ')
  end
end
