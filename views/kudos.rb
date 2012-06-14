class Kudos
  def initialize programmers 
    @programmers = programmers
  end

  def render
    sorted_programmers = @programmers.sort_by { |programmer|
      programmer.kudos
    }.reverse

    Hirb::Helpers::AutoTable.render sorted_programmers,
      :class => ProgrammerWithKudos,
      :fields => [:name, :kudos]
  end
end
