require 'pry'
require 'csv'
require_relative 'comment'

class Gossip
  attr_accessor :author, :content

  def initialize(author, content)
    @author = author
    @content = content
  end

  #enregistrer le gossip dans csv
  def save
    CSV.open("db/gossip.csv", "ab") do |csv|
      csv << [@author, @content]
    end
  end

  #pour afficher tous les gossips
  def self.all
    all_gossips = []
    CSV.read("./db/gossip.csv").each do |csv_line|
      all_gossips << Gossip.new(csv_line[0], csv_line[1])
    end
    return all_gossips
  end

  #pour trouver un gossip en fonction de l'index
  def find(id)
    table = CSV.parse(File.read("db/gossip.csv"))
    table2 = []
    table2 << table[id]
    puts table2
    return table2
  end

  #pour modifier le gossip
  def update(author, content, n)
    puts author
    puts content

    rows_array = CSV.read('db/gossip.csv')
      rows_array[n][0] = author
      rows_array[n][1] = content
    CSV.open('db/gossip.csv', 'wb') { |csv| rows_array.each{|row| csv << row}}
    
    
  end

end
