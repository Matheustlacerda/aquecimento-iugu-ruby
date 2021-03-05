require_relative 'study_item'

INSERT  = 1
LIST    = 2
SEARCH  = 3
STUDIED = 4
EXIT    = 5

def clear
  system('clear')
end

def wait_keypress
  puts
  puts 'Pressione enter para continuar'
  gets
end

def wait_keypress_and_clear
  wait_keypress
  clear
end

def welcome
  'Bem-vindo ao Diário de Estudos, seu companheiro para estudar!'
end

def menu
  puts "[#{INSERT}] Cadastrar um item para estudar"
  puts "[#{LIST}] Ver todos os itens cadastrados"
  puts "[#{SEARCH}] Buscar um item de estudo"
  puts "[#{STUDIED}] Informar item estudado"
  puts "[#{EXIT}] Sair"
  print 'Escolha uma opção: '
  gets.to_i
end

clear
puts welcome
option = menu

loop do
  clear
  case option
  when INSERT
    StudyItem.register
  when LIST
    puts StudyItem.all
    puts 'Nenhum item encontrado' if StudyItem.all.empty?
  when SEARCH
   StudyItem.search_items   
  when STUDIED
    StudyItem.studied_items
  when EXIT
    clear
    puts 'Obrigado por usar o Diário de Estudos'
    break
  else
    puts 'Opção inválida'
  end
  wait_keypress_and_clear
  option = menu
end