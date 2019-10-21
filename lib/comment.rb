require 'pry'
require 'csv'

class Comment
  attr_accessor :author, :content, :gossip_id
  
  def initialize(author, content, gossip_id)
    @author = author
    @content = content
    @gossip_id = gossip_id
  end

  def save
    CSV.open("db/comment.csv", "ab") do |csv|
      csv << [@author, @content, @gossip_id]
    end
  end

  def self.all
    all_comments = []
    CSV.read("./db/comment.csv").each do |csv_line|
      all_comments << Comment.new(csv_line[0], csv_line[1], csv_line[2])
    end
    return all_comments
  end

end