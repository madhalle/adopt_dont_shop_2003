# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
shelter_1 = Shelter.create(name: "All the Pets",
                            address: "17 Random Rd",
                            city: "Denver",
                            state: "CO",
                            zip: 80113)

pet1 = shelter_1.pets.create!( image: "https://i.redd.it/ilfdwwjo9zs11.png",
                    name: "Gerald",
                    age: 62,
                    sex: "Male",
                    shelter_id: shelter_1.id,
                    description: "Loves long walks on the beach",
                    adoption_status: "adoptable")
pet2 = shelter_1.pets.create!( image: "https://blog.explore.org/wp-content/uploads/2018/09/fat-bear-blog.jpg",
                    name: "Minnie",
                    age: 4,
                    sex: "Female",
                    shelter_id: shelter_1.id,
                    description: "Likes to unwind witha glass of red",
                    adoption_status: "adoptable"
                  )
