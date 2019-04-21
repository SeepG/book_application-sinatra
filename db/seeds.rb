puts 'Start of Seeding...'

10.times do
  params = {
    title: Faker::Book.title,
    author: Faker::Book.author,
    genre: Faker::Book.genre
  }
  puts "Creating Books: #{params[:title]}"
  book = Book.new(params)
  book.save
end

puts 'Seeding Over'
