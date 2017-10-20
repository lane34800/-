students = ['Suzy', 'Daniel', 'James', 'Mary', 'Phillip', 'Siegfried']

students.each do |prop|
  if prop.include? 'a'
    this_index = students.index prop
    students[this_index] = "A+" + prop
  end
end

students = students.sort
puts print students

counter = 0

students.each do |prop|
  if prop.include? 'A+'
    counter = counter + 1
  end
end

puts counter


my_mac = {
  maker: "Apple",
  model: "Retina Mac Book Pro",
  keyboard_layout: "azerty",
  ports: ["USB", "ThunderBolt", "Audio", "HDMI"],
  resolution: "2560x1600"
}