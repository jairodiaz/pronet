class Programmer
  attr_reader :name, :skills, :recommendations

  def initialize name, skills, recommendations
    @name = name
    @skills = skills
    @recommendations = recommendations
  end
end
