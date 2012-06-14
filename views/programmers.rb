require 'hirb'

class Programmers
  def render 
    Hirb::Helpers::AutoTable.render([])
  end
end
