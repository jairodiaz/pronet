require 'xmlsimple'
require './programmer'

def retrieve_programmers_data(buffer)
	ref  = XmlSimple.xml_in(buffer)
	programmer_list = ref['Programmer']
	programmer_list.collect { |programmer_element|
		name = programmer_element['name']
		recommendations = programmer_element['Recommendations'][0]['Recommendation']
		skills = programmer_element['Skills'][0]['Skill']
		Programmer.new name, skills, recommendations
  }
end


def retrieve_programmers(filename)
	file = File.open(filename)
	retrieve_programmers_data(file)
end


def retrieve_programmers_with_kudos(filename)
	file = File.open(filename)
	retrieve_programmers_data_with_kudos(file)
end

def retrieve_programmers_data_with_kudos(buffer)
	programmers = retrieve_programmers_data(buffer)

    return programmers

	programmers.collect { |programmer|
		ProgrammerWithKudos.new(programmer, 1)
	}
end


