require 'xmlsimple'
require 'awesome_print'
require './programmer'

def retrieve_programmers (filename)
	file = File.open(filename)
	ref  = XmlSimple.xml_in(file)

	programmer_list = ref['Programmer']
	programmer_array = programmer_list.collect do |programmer_element|
		name = programmer_element['name']
		recommendations = programmer_element['Recommendations'][0]['Recommendation']
		skills = programmer_element['Skills'][0]['Skill']
		Programmer.new name, skills, recommendations
	end
	programmer_array
end

ap retrieve_programmers '/Users/jairodiaz/GitHub/pronet/ProNet.xml'