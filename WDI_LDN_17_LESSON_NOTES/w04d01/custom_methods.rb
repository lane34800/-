class Tree

  attr_accessor :kind, :color 
  @@tree_count = 0 
  def initialize (kind, color)
    @@tree_count += 1
    @kind = kind
    @color = color 
    @height
  end

  def Tree.count
    @@tree_count
  end

  def grow inches
    height =+ inches
    puts "I am sooo tall, I am now #{height} foot tall."
  end

  def fall
    puts "I am an #{color} #{kind} tree and I have just fallen over :( "
  end



end


tree1 = Tree.new('orange', 'green')
tree1.grow(13)
tree1.grow(20)
tree1.fall