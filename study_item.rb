class StudyItem
  attr_reader :id, :title, :category

  @@next_id = 1
  @@study_items = []

  def initialize(title:, category:)
    @id = @@next_id
    @title = title
    @category = category

    @@next_id += 1
    @@study_items << self 
  end

  def include?(query)
    title.downcase.include?(query.downcase) || category.downcase.include?(query.downcase)
  end

  def to_s
    "##{id} - #{title} - #{category}" 
  end
  
  def self.register
    print 'Digite o título do seu item de estudo: '
    title = gets.chomp
    print 'Digite a categoria do seu item de estudo: '
    category = gets.chomp
    puts "Item '#{title}' da categoria '#{category}' cadastrado com sucesso!"
    new(title: title, category: category)
  end

  def self.all
    @@study_items    
  end

  def self.search_items
    print 'Digite uma palavra para procurar: '
    term = gets.chomp
    found_items = all.filter do |item|
      item.include?(term)
    end
    puts found_items
    puts "\nNenhum item encontrado" if found_items.empty?  #quando já tem um item não está mostrando essa informação
  end    

  def self.studied_items
    puts '----------  Lista de itens  ----------'
    puts @@study_items
    puts
    puts 'Qual o id do item que já foi finalizado o estudo?'
    id = gets.to_i
    study_item = all.detect { |item| item.id == id }
    end
 
end
