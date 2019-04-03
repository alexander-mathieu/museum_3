class Museum
  attr_reader :name,
              :exhibits,
              :patrons

  def initialize(name)
    @name     = name
    @exhibits = []
    @patrons  = []
  end

  def add_exhibit(exhibit)
    @exhibits.push(exhibit)
  end

  def admit(patron)
    @patrons.push(patron)
  end

  def recommend_exhibits(patron)
    @exhibits.find_all do |exhibit|
      patron.interests.include?(exhibit.name)
    end
  end

  def patrons_by_exhibit_interest
    @exhibits.inject(Hash.new{[]}) do |acc, exhibit|
      @patrons.each do |patron|
        if recommend_exhibits(patron).include?(exhibit)
          acc[exhibit] += [patron]
        end
      end
      acc
    end
  end

end
