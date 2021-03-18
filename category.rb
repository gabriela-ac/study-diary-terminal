class Category
  attr_reader :name
  attr_accessor :study_items

  def initialize(name:)
    @name = name
    @study_items = []
  end
  
  CATEGORIES = [new(name: 'Ruby'), new(name: 'Rails'), new(name: 'HTML')]
  
  def to_s
    name.to_s
  end

  def include?(term)
    name.include?(term)
  end

  def self.all
    CATEGORIES
  end

  def self.index(number)
    CATEGORIES[number]
  end
end