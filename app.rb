# We need to require the MongoDB Ruby driver before we begin using NoSQL
require 'mongo'

# The MongoDB server will live on port 27017 of your localhost by default.
# Here we are establishing the connection to the MongoDB server, and accessing the test database.
client = Mongo::Client.new([ '127.0.0.1:27017' ], :database => 'test')

# Here we are creating a new collection which is like a database called 'flatironschool'
# We are then creating a new table in our 'flatironschool' collection called 'students'
flatironschool = client[:students]


# This is the data we plan on inserting into our 'students' table.
# As you can see, 'students' has two columns, 'name' and 'current_track'
data = { name: 'Jason', current_track: 'Deploy on Day One' }

# We are now going to run the insert_one method on our collection to insert our new data
# This inserts and saves into the collection all at once.
flatironschool.insert_one(data)

# We could also query our collection using the find method.
@names_of_students = []

# This will loop through the 'flatironschool' collection and find every document we inserted.
# 'student' is an object, and we could call the attributes on that object, like 'name'
flatironschool.find.each do | student |
  @names_of_students << student.name
end

# As you can see, this is quite simple. And you don't even need ActiveRecord to abstract the SQL statements.
# Wanna know why? Because it isn't SQL.