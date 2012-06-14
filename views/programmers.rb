require 'hirb'

require './programmer'

class Programmers
  def initialize programmers
    @programmers = programmers
  end

  def render 
    Hirb::Helpers::AutoTable.render @programmers,
      :class => Programmer,
      :fields => [:name, :skills, :recommendations]
  end
end
