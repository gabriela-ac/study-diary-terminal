require_relative 'category'

class StudyItem
  attr_reader :title, :category

  @@study_items = []

  def initialize(title:, category:)
    @title = title
    @category = category
    @category.study_items << self
    puts "Item '#{title}' da categoria '#{category}' cadastrado com sucesso!"
    @@study_items << self
  end

  def to_s
    "#{title} - #{category}"
  end

  def include?(term)
    title.include?(term) || category.include?(term)
  end

  def self.insert
    print 'Digite o título do seu item de estudo: '
    title  = gets.chomp
    print 'Digite a categoria do seu item de estudo: '
    category  = gets.chomp
    Category.study_items << new(title: title, category: category)
  end

  def self.all
    @@study_items
  end

  def self.search # criar
  end
end