require 'io/console'
require_relative 'study_item'

INSERT = 1
VIEW = 2
SEARCH = 3
EXIT = 4

def welcome
  'Bem-vindo ao Diário de Estudos, seu companheiro para estudar!'
end

def menu
  puts "[#{INSERT}] Cadastrar um item para estudar"
  puts "[#{VIEW}] Ver todos os itens cadastrados"
  puts "[#{SEARCH}] Buscar um item de estudo"
  puts "[#{EXIT}] Sair"
  print 'Escolha uma opção: '
  gets.to_i
end

def register_study_item
  print 'Digite o título do seu item de estudo: '
  title  = gets.chomp
  print_items(Category.all)
  print 'Escolha uma categoria para o seu item de estudo: '
  category  = gets.to_i - 1
  # puts "Item '#{title}' da categoria '#{category}' cadastrado com sucesso!"
  StudyItem.new(title: title, category: Category.index(category))
end

def print_items(collection)
  collection.each.with_index(1) do |item, index|
    puts "##{index} - #{item}"
  end
  puts 'Nenhum item encontrado' if collection.empty?
end

def search_items(collection)
  print 'Digite uma palavra para procurar: '
  term = gets.chomp
  found_items = collection.filter do |item|
    item.include?(term)
  end
  print_items(found_items)
end

def clear
  system('clear')
end

def wait_keypress
  puts
  puts 'Pressione qualquer tecla para continuar'
  STDIN.getch
end

def wait_and_clear
  wait_keypress
  clear
end

clear
puts welcome
option = menu

while option != EXIT
  if option == INSERT
    register_study_item
    wait_and_clear
  elsif option == VIEW
    puts StudyItem.all
    wait_keypress
    clear
  elsif option == SEARCH
    search_items(StudyItem.all)
    wait_and_clear
  else
    puts 'Opção inválida'
    wait_and_clear
  end
  option = menu
end

puts 'Obrigado por utilizar o Diário de Estudos'