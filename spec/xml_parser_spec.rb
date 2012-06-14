require './programmer'
require './xmlparser.rb'

describe "XMLParser" do

	it 'should read a sample file' do

		xml_data = <<-XML_FILE 
<?xml version="1.0" encoding="utf-8" ?>
<Network>
  <Programmer name='Bill'>
    <Recommendations>
      <Recommendation>Jason</Recommendation>
      <Recommendation>Jill</Recommendation>
      <Recommendation>Nick</Recommendation>
      <Recommendation>Stu</Recommendation>
    </Recommendations>
    <Skills>
      <Skill>Ruby</Skill>
      <Skill>Perl</Skill>
      <Skill>PHP</Skill>
    </Skills>
  </Programmer>
  </Network>			
		XML_FILE
	
		programmer = retrieve_programmers_data xml_data
		programmer[0].name.should == 'Bill'
		programmer[0].recommendations.should == ['Jason', 'Jill', 'Nick', 'Stu']
		programmer[0].skills.should == ['Ruby', 'Perl', 'PHP']
	end
end