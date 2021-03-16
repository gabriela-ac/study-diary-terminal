class StudyItem
  attr_reader :title, :category

  def initialize(title:, category:)
    @title = title
    @category = category
  end

  def to_s
    "#{title} - #{category}"
  end

  def include?(term)
    title.include?(term) || category.include?(term)
  end
end