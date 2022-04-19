ACTORS_LIST_PATH = 'artists.txt'
BUFFER = 'buffer.txt'

def index
  File.foreach(ACTORS_LIST_PATH) { |actor| puts actor }
end

def find(id)
  File.foreach(ACTORS_LIST_PATH).with_index do |actor, index|
    puts actor if id == index
  end
end

def where(pattern)
  File.foreach(ACTORS_LIST_PATH).with_index do |actor, index|
    @actor_id = index if actor.include?(pattern)
  end

  @actor_id
end

def update(id, text)
  file = File.open(BUFFER, 'w')
  
  File.foreach(ACTORS_LIST_PATH).with_index do |actor, index|
    file.puts(id == index ? text : actor)
  end

  file.close
  File.write(ACTORS_LIST_PATH, File.read(BUFFER))

  File.delete(BUFFER) if File.exist?(BUFFER)
end

def delete(id)
  file = File.open(BUFFER, "w")
  File.foreach(ACTORS_LIST_PATH).with_index do |actor, index|
    file.puts actor if id != index
  end

  file.close
  File.write(ACTORS_LIST_PATH, File.read(BUFFER))

  File.delete(BUFFER) if File.exist?(BUFFER)
end

# index
# update(2, "Keanu Charles Reeves")
# where('McConaughey')
# delete(1)
# index