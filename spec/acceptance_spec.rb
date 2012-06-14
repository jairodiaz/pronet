require './spec/spec_helper'

describe 'displaying the programmers' do
  it 'should render the XML file' do
    `./render_programmers ProNet.xml`.strip.should == the_table('
      +-------+-----------------+------------------------+
      | name  | skills          | recommendations        |
      +-------+-----------------+------------------------+
      | Bill  | Ruby, Perl, PHP | Jason, Jill, Nick, Stu |
      | Dave  | Java, C#        | Jill                   |
      | Ed    | C++, Python     | Liz, Rick              |
      | Frank | Perl, Ruby, C++ | Nick                   |
      | Jason | Java, Ruby      | Dave, Liz              |
      | Jill  | C++, Ruby       | Nick                   |
      | Liz   | C#, C++, Java   | Bill                   |
      | Nick  | C#, Java        | Stu                    |
      | Rick  | Java, PHP       | Ed                     |
      | Stu   | C++, Perl       | Frank                  |
      +-------+-----------------+------------------------+
      10 rows in set
    ')
  end
end
