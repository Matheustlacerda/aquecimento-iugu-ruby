class StudyItem
  attr_reader :id, :title, :category, :status

  @@next_id = 1
  @@study_items = []

  def initialize(title:, category:, status: false)
    @id = @@next_id
    @title = title
    @category = category
    @status = status

    @@next_id += 1
    @@study_items << self
  end

  def include?(query)
    title.downcase.include?(query.downcase) || category.downcase.include?(query.downcase)
  end

  def finished
    @status = true
  end

  def to_s
    "##{id} - #{title} - #{category} [#{finished ? ' ' : 'X'}]"
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
    puts "\nNenhum item encontrado" if found_items.empty?
  end    

  def self.studied_items
    puts '----------  Lista de itens de estudo  ----------'
    puts @@study_items
    puts
    puts 'Qual o id do item que já foi finalizado o estudo?'
    id = gets.to_i
    item = all.filter { |item| item.id == id }.first
    if item.nil?
      puts "\nId informado inválido"
    else
      item.finished
      puts "\nStatus do item atualizado com sucesso"
    end
  end
end