class Programmer
  attr_reader :name, :skills, :recommendations

  def initialize name, skills, recommendations
    @name = name
    @skills = skills
    @recommendations = recommendations
  end
end

class Programmers
    attr_reader :programmers

    def initialize all_programmers
        @programmers = all_programmers
    end

    def find_those_who_recommend programmer
        
        @programmers.find_all do |recommender| 
            recommender.recommendations.include? programmer.name
        end
    end
end

class ProgrammerWithRelationships
  attr_reader :name

  def initialize programmer, all_programmers
    @name = programmer.name
    @recommendations = programmer.recommendations.collect { |recommendation|
      all_programmers.find { |other| other.name == recommendation }
    }
  end
end

class ProgrammerWithKudos
  attr_reader :name, :kudos

  def initialize programmer, kudos
    @name = programmer.name
    @kudos = kudos
  end
end

