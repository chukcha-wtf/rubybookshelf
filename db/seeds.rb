User.delete_all
Author.delete_all
Book.delete_all

puts "Creating Users"
roles = %w{guest user admin}
roles.each do |role|
  u = User.create(email: "#{role}@mail.com", 
              password: "123456", 
              password_confirmation: "123456",
              fullname: "#{role.capitalize} User",
              role: role)
  if role != 'guest'
    3.times do |i|
      b = Book.new(title: "Book #{i} for #{role.capitalize}",
                    description: "Book details #{i} for #{role.capitalize}")
      b.author = Author.new(fullname: "Author #{i}",
                            bio: "Bio for Author",
                            user_id: u.id)
      u.books << b
    end
  end

  puts "Created #{u.fullname}"
end