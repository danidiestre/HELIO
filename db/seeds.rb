# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
require "open-uri"
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Review.destroy_all
Booking.destroy_all
p "Bookings destroyed!"
Iteration.destroy_all
p "Iterations destroyed!"
Event.destroy_all
p "Events destroyed!"
Category.destroy_all
p "Categories destroyed!"
User.destroy_all
p "Users destroyed!"
p "-------------"


categories_array = [
  {
    name: 'Theatre',
    image_url: "https://images.unsplash.com/photo-1503095396549-807759245b35?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1502&q=80"
  },
  {
    name: 'Monologues',
    image_url: "https://howtowritefunny.com/wp-content/uploads/2019/02/Crash-Course-in-StandupSMALL.jpg"
  },
  {
    name: 'Comedy',
    image_url: "https://images.unsplash.com/photo-1543584756-8f40a802e14f?ixlib=rb-1.2.1&ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&auto=format&fit=crop&w=1500&q=80"
  },

  {
    name: 'Magic',
    image_url: "https://images.indianexpress.com/2019/06/magic.jpg"
  },

  {
    name: 'Improv',
    image_url: "https://images.theconversation.com/files/202495/original/file-20180118-158536-13l30yw.jpg?ixlib=rb-1.1.0&q=45&auto=format&w=496&fit=clip"
  },

  {
    name: 'Dance',
    image_url: "https://images.unsplash.com/photo-1518834107812-67b0b7c58434?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=675&q=80"
  },

  {
    name: 'Show + Dinner',
    image_url: "https://images.unsplash.com/photo-1533777857889-4be7c70b33f7?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80"
  },

  {
    name: 'Concerts',
    image_url: "https://images.unsplash.com/photo-1499364615650-ec38552f4f34?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1266&q=80"
  },

  {
    name: 'Festivals',
    image_url: "https://images.unsplash.com/photo-1533174072545-7a4b6ad7a6c3?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1500&q=80"
  },

  {
    name: 'Classical Music + Opera',
    image_url: "https://images.unsplash.com/photo-1508025690966-2a9a1957da31?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1000&q=80"
  }]


categories_array.each do |category|
  cat = Category.create(name: category[:name])
  image_file = URI.open(category[:image_url])
  cat.photo.attach(io: image_file, filename: 'image.png', content_type: 'image/png')
end

p "Created #{Category.count} categories"


#########################


event_1 = Event.create(
  title:'El Mètode Grönnholm',
  description: "No te puedes perder El Mètode Grönnholm en el Teatre Poliorama.En el año 2003 El método Grönholm se estrenó por primera vez en el Teatro Nacional de Cataluña y desde entonces ha traspasado todas las fronteras: se ha convertido en un éxito de público tanto en Cataluña, como en el resto del Estado como en el ámbito internacional.",
  language: 'catalan',
  address: 'Ramblas, 115 (Barcelona)',
  audience: 'adults',
  category_id: Category.find_by(name:'Comedy').id
)

event_1_photo = URI.open('https://images.unsplash.com/photo-1585699324551-f6c309eedeca?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80')
event_1.photo.attach(io: event_1_photo, filename: 'event1.jpg', content_type: 'image/jpg')

recent_iteration = Iteration.create(event_id: event_1.id, price: 10, start_date: DateTime.new(2020,12,12,15))
Iteration.create(event_id: event_1.id, price: 15, start_date: DateTime.new(2020,12,24,17))

#########################

event_2 = Event.create(
  title:'Navidad con Toni Moog',
  description: "Toni Moog vuelve a casa por Navidad para seguir pateando el culo al espíritu navideño tras 12 temporadas consecutivas de éxito. Navidad con Toni Moog rememora, a través de su peculiar estilo canalla y sin pelos en la lengua, las típicas escenas de estos días tan señalados: cenas de celebración, regalos, amigos invisibles, villancicos, anuncios de TV, lotería, programación especial de televisión, turrones, polvorones, mantecados, uvas, campanadas, familia, panderetas, zambombas, desmadre, resaca…",
  language: 'spanish',
  address: 'Urquinaona, 9 (Barcelona)',
  audience: 'all ages',
  category_id: Category.find_by(name:'Theatre').id
)

event_2_photo = URI.open('https://images.unsplash.com/photo-1475721027785-f74eccf877e2?ixlib=rb-1.2.1&ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&auto=format&fit=crop&w=1350&q=80')
event_2.photo.attach(io: event_2_photo, filename: 'event2.jpg', content_type: 'image/jpg')

Iteration.create(event_id: event_2.id, price: 18, start_date: DateTime.new(2021,1,25,17))
Iteration.create(event_id: event_2.id, price: 23, start_date: DateTime.new(2021,1,23,17))

#########################

event_3 = Event.create(
  title:'Nada es imposible - Mago Pop',
  description: "Nada es imposible es el espectáculo de Antonio Díaz, El Mago Pop, que llega al Teatre Victòria de Barcelona, ofreciendo un viaje por lo extraordinario lleno de asombro, diversión, sensibilidad, sorpresas, ritmo y emoción, en una aventura llena de ilusiones que confirma que, cuando El Mago Pop está en escena, ¡nada es imposible!",
  language: 'spanish',
  address: 'Avda. Paral·lel, 67 (Barcelona)',
  audience: 'all ages',
  category_id: Category.find_by(name:'Magic').id
)

event_3_photo = URI.open('https://lh3.googleusercontent.com/proxy/XwTx2qLCml6owq-ipIwjzmrrbAesTFPd8olv4BMHEVTRQCnei4Pfg_Qvoagdqtu9nG-sXbBFNIH-FTLhqrH48rRJkbtW3Rh6eVx6bCb_z7_Q6FIQXnqHAKZcliMRrQ')
event_3.photo.attach(io: event_3_photo, filename: 'event3.jpg', content_type: 'image/jpg')

Iteration.create(event_id: event_3.id, price: 31, start_date: DateTime.new(2021,1,10,17))
Iteration.create(event_id: event_3.id, price: 31, start_date: DateTime.new(2021,1,12,17))

#########################

event_4 = Event.create(
  title:'Vermunólogos',
  description: "¡Cuidado, han llegado los Vermunólogos! Un show de monólogos, vermut, tapeo, música, improvisación, cómicos invitados... ¡Todo esto en el Café Teatro Llantiol! Mucho más que una función de comedia, ¡Esto es una fiesta!",
  language: 'spanish',
  address: 'Riereta, 7. (Barcelona)',
  audience: 'family',
  category_id: Category.find_by(name:'Monologues').id
)

event_4_photo = URI.open('https://cdn.atrapalo.com/common/photo/event/2/8/8/309/949457/vertic_880_0.jpg')
event_4.photo.attach(io: event_4_photo, filename: 'event4.jpg', content_type: 'image/jpg')

Iteration.create(event_id: event_4.id, price: 8, start_date: DateTime.new(2021,1,5,17))
Iteration.create(event_id: event_4.id, price: 9, start_date: DateTime.new(2021,1,5,19))

#########################

event_5 = Event.create(
  title:'Impro Show',
  description: "Los actores, un escenario y una caja repleta de frases escritas por los espectadores. Estos son los ingredientes principales que abren la puerta a Impro Show. El resto: creación, imaginación, humor y mucha capacidad de reacción. ¡Descubre el fenómeno impro en Teatreneu! Planeta Impro, creadores del “fenómeno impro” y referentes a nivel nacional del mejor humor improvisado, presentan Impro Show. Un espectáculo fresco, original y interactivo!",
  language: 'spanish',
  address: 'Riereta, 7. (Barcelona)',
  audience: 'family',
  category_id: Category.find_by(name:'Improv').id
)

event_5_photo = URI.open('https://www.shbarcelona.es/blog/es/wp-content/uploads/2015/12/teatro-de-improvisaci%C3%B3n-en-barcelona-2.jpg')
event_5.photo.attach(io: event_5_photo, filename: 'event5.jpg', content_type: 'image/jpg')

Iteration.create(event_id: event_5.id, price: 8, start_date: DateTime.new(2021,2,5,17))
Iteration.create(event_id: event_5.id, price: 9, start_date: DateTime.new(2021,2,5,19))

#########################

event_6 = Event.create(
  title:'Emociones - Espectáculo flamenco',
  description: "En el Teatro Flamenco Madrid disfrutarás de una experiencia única: descubrir la auténtica esencia del flamenco. Es el primer teatro dedicado en exclusiva a este género reconocido Patrimonio Inmaterial de la Humanidad por la UNESCO. Con el propósito de acercar el flamenco a todos los públicos, además de conciertos de reconocidos artistas, cuenta en su programación diaria, de lunes a domingo, con Emociones un espectáculo de cante, baile y guitarra con un elenco de artistas de primer nivel que recorren los principales estilos del flamenco. En el marco único de la sala de un teatro y a la luz de las velas, un ambiente tan íntimo y acogedor que recuerda a los míticos cafés cantantes despierta la magia que conecta al espectador con el artista. Emociones es una manera diferente de vivir y sentir el flamenco. El Teatro Flamenco Madrid se encuentra en el popular e histórico barrio de Malasaña, zona de tendencias que concentra tiendas vintage, librerías, mercadillos y bares situados a escasos pasos de la animada Gran Vía de Madrid. A poco más de dos años de su apertura, el Teatro Flamenco Madrid es un referente de la escena cultural y flamenca de la capital.",
  language: 'spanish',
  address: 'Calle del Pez, 10 (Madrid)',
  audience: 'adults',
  category_id: Category.find_by(name:'Dance').id
)
event_6_photo = URI.open('https://www.65ymas.com/uploads/s1/22/50/3/teatro-flamenco-de-madrid-sebastia-n-rocotovich-teatro-flamenco-madrid.jpeg')
event_6.photo.attach(io: event_6_photo, filename: 'event6.jpg', content_type: 'image/jpg')

Iteration.create(event_id: event_6.id, price: 18, start_date: DateTime.new(2020,12,10,19))
Iteration.create(event_id: event_6.id, price: 20, start_date: DateTime.new(2020,12,10,24))

#########################


event_7 = Event.create(
  title:'Sergio Dalma, en concierto',
  description: "Sergio Dalma se sube al escenario del Auditori del Fòrum de Barcelona para presentar su nuevo disco 30… y tanto, un álbum que celebra los 30 años de carrera de una de las voces más icónicas de nuestro país.Un disco que recoge una colección de 13 clásicos elegidos personalmente Sergio y que ahora renueva con su inconfundible estilo, elegancia y clase. A estos clásicos se suman tres temas inéditos como Donna que fue el adelanto del álbum de celebración de los 30 años de la carrera de Sergio. Un concierto en el que podrás disfrutar de canciones como Esta chica es mía, Galilea, Solo para ti o Bailar pegados, entre otros. ¡Disfruta en directo de la cautivora voz rota del cantante de catalán!",
  language: 'spanish',
  address: 'Leonardo Da Vinci, s/n (Barcelona)',
  audience: 'adults',
  category_id: Category.find_by(name:'Concerts').id
)

event_7_photo = URI.open('https://static2.ideal.es/www/multimedia/201809/22/media/granada/GALERIA-sergio/PMZ210918sergio_dalma%200272.jpg')
event_7.photo.attach(io: event_7_photo, filename: 'event7.jpg', content_type: 'image/jpg')

Iteration.create(event_id: event_7.id, price: 25, start_date: DateTime.new(2020,12,17,19))
Iteration.create(event_id: event_7.id, price: 40, start_date: DateTime.new(2020,12,18,18))

#########################

event_8 = Event.create(
  title:'Aquarella Music Restaurant',
  description: "¡Regala a tu paladar y a tu alma esta cena con espectáculo musical en Aquarella Music Restaurant! Aquarella es una experiencia, diferente, original, única en Barcelona, y sobre todo personalizada, donde el trato con el cliente es exclusivo creando un vínculo importante con la cena y el espectáculo. Los más de 10 artistas en el escenario, 15 cambios de vestuario, cantantes en directo, maestros de ceremonias, 4 cambios de escenografía, crearán el entorno perfecto para cualquier celebración especial. Un espectáculo que sorprende por la innovación, creando una puesta en escena cuidada hasta el último detalle y nuestra cena se compone de platos seleccionados de la dieta mediterránea, donde podrán disfrutar del diseño y cuidado de un producto fresco y elaborado. Una experiencia diferente de la que siempre se sale contento, déjate llevar hacia una nueva forma de pasar una velada única. Cualquier evento o reunión es digno de tener una cita especial y para eso Aquarella Music Restaurant es el lugar idóneo para disfrutar de una cocina mediterránea de mercado, que junto a su equipo artístico crearán un momento irrepetible lleno de sorpresas.",
  language: 'spanish',
  address: 'Gran Vía, 572 (Barcelona)',
  audience: 'adults',
  category_id: Category.find_by(name:'Show + Dinner').id
)

event_8_photo = URI.open('https://res.cloudinary.com/tf-lab/image/upload/restaurant/678e947e-ff4e-4a7d-bb94-2fbd505115d3/434d46da-8b19-4e68-baf5-853033ac2184.jpg')
event_8.photo.attach(io: event_8_photo, filename: 'event8.jpg', content_type: 'image/jpg')

Iteration.create(event_id: event_8.id, price: 25, start_date: DateTime.new(2020,12,10,19))
Iteration.create(event_id: event_8.id, price: 40, start_date: DateTime.new(2020,12,16,18))

#########################

event_9 = Event.create(
  title:'India Martínez- Guitar BCN Festival 2020',
  description: "La cordobesa India Martínez afronta el lanzamiento de su octavo disco, Palmeras (Sony, 2019) con la determinación de quien sabe que ha conseguido un lugar propio en la música. En sus casi 15 años de carrera, India Martínez no ha parado de girar, de colaborar con artistas de primer nivel como Pitingo, David Bisbal o Niña Pastori, y de recibir premios, como el Goya a la mejor canción que consiguió en 2015 para la película El Niño, de Daniel Monzón. Con un estilo propio a medio camino entre la canción melódica y el flamenco pop, Martínez también ha sabido incorporar las músicas urbanas sin renunciar a su esencia. De hecho, su nuevo trabajo le permite reconectar con sus orígenes -le creció en el barrio de Las Palmeras, de Córdoba- y empoderarse aún más gracias canciones como La gitana, su nuevo éxito, que ella describe como un grito de guerra que mujeres y niñas de todo tipo llevamos dentro",
  language: 'spanish',
  address: 'Leonardo Da Vinci, s/n (Barcelona)',
  audience: 'adults',
  category_id: Category.find_by(name:'Festivals').id
)

event_9_photo = URI.open('https://lh3.googleusercontent.com/proxy/RmKN-P-XaMYfv4GEG6RR7rSrwmydNs7mrPcmVaXIv4hll_jYB3lXHsFFpxc3Ogm7gqL4TWK9khhirRtEl4RFOpfClIhv_LpHF-IcpwXwRmh_4xlt9gq32jXbXr7nONaN4Uf48MoHrA1utC2oMN-EIR01WQ')
event_9.photo.attach(io: event_9_photo, filename: 'event9.jpg', content_type: 'image/jpg')

Iteration.create(event_id: event_9.id, price: 45, start_date: DateTime.new(2020,12,20,19))
Iteration.create(event_id: event_9.id, price: 50, start_date: DateTime.new(2020,12,19,18))

#########################

event_10 = Event.create(
  title:'Callas en concierto - En holograma',
  description: "Un espectáculo impactante que ha triunfado en el Teatro Pleyel de París y que ahora podrás disfrutar en el Gran Teatro Bankia Príncipe Pío, en el que como por arte de magia, María Callas vuelve a escena radiante, con su inolvidable voz, gracias a la técnica del holograma. María Callas volverá a escena con una proeza tecnológica en 3D desarrollada por la empresa de Estados Unidos BASE Hologram, co productora del show, consiguiendo que la mítica cantante lírica se muestre nuevamente al público como si estuviera allí de nuevo, en carne y hueso. El show irá acompañado por la OSB, la Orquesta Sinfónica de Bankia, con 20 músicos en directo que interpretarán el emblemático repertorio de María Callas mientras se escucha su voz perfectamente orquestada tanto con la sinfónica como con la alta tecnología.",
  language: 'spanish',
  address: 'Cuesta de San Vicente, 44 (Madrid)',
  audience: 'Adults',
  category_id: Category.find_by(name:'Classical Music + Opera').id
)

event_10_photo = URI.open('https://www.esmadrid.com/sites/default/files/eventos/eventos/callas.jpg')
event_10.photo.attach(io: event_10_photo, filename: 'event10.jpg', content_type: 'image/jpg')

Iteration.create(event_id: event_10.id, price: 69, start_date: DateTime.new(2020,12,19,19))
Iteration.create(event_id: event_10.id, price: 50, start_date: DateTime.new(2020,12,18,20))


p "Also created #{Event.count} Events with #{Iteration.count} Iterations"


####################################################


avatar_ana = URI.open('https://media-exp1.licdn.com/dms/image/C4E03AQES3TPGourBwg/profile-displayphoto-shrink_800_800/0/1517466023378?e=1612396800&v=beta&t=rrMXlDr6agrpQS0_YnrFKHCxuWHfpaxhW2sDoMtiVR4')
ana = User.create!(email: "ana@gmail.com", password: "password", first_name: "Ana", last_name: "Bajo")
ana.avatar.attach(io: avatar_ana, filename: 'ana.png', content_type: 'image/png')

rocio = User.create!(email: 'rocio@gmail.com', password: 'password', first_name: "Rocio", last_name:"Nadal")
avatar_rocio = URI.open('https://media-exp1.licdn.com/dms/image/C4D03AQHWSUqNdAXHcQ/profile-displayphoto-shrink_800_800/0/1596640241152?e=1612396800&v=beta&t=MXHi43SBRu6f1nRNdK06yfoTH3khbirL4fLfzMH1pbU')
rocio.avatar.attach(io: avatar_rocio, filename: 'rocio.png', content_type: 'image/png')

dani = User.create!(email: "dani@gmail.com", password: "password", first_name: "Dani", last_name: "Diestre")
avatar_dani = URI.open('https://media-exp1.licdn.com/dms/image/C4D03AQEK9HaUmStSVA/profile-displayphoto-shrink_800_800/0?e=1612396800&v=beta&t=dgCFjJPjYrJOVYgifWDWqACUU2Rvg2wneJUVIFO-jb0')
dani.avatar.attach(io: avatar_dani, filename: 'dani.png', content_type: 'image/png')

bruna = User.create!(email: "bruna@gmail.com", password: "password", first_name: "Bruna", last_name: "Scopel")
avatar_bruna = URI.open('https://scontent-mad1-1.xx.fbcdn.net/v/t1.0-9/86697044_3433571363324662_8857190224778756096_o.jpg?_nc_cat=104&ccb=2&_nc_sid=09cbfe&_nc_ohc=2TkTxmqmjCYAX9x3D4V&_nc_ht=scontent-mad1-1.xx&oh=3e33322ca309d6094de856549efdffe5&oe=5FEFE3BD')
bruna.avatar.attach(io: avatar_bruna, filename: 'bruna.png', content_type: 'image/png')

jaume = User.create!(email: "jaume@gmail.com", password: "password", first_name: "Jaume", last_name: "Ros")
avatar_jaume = URI.open('https://scontent-mad1-1.xx.fbcdn.net/v/t1.0-9/102261476_4326706187354465_4726682033989961974_n.jpg?_nc_cat=102&ccb=2&_nc_sid=09cbfe&_nc_ohc=g5gFygsSFvsAX8dd2L9&_nc_ht=scontent-mad1-1.xx&oh=8463412a9d20c5e0835fc02d5acb70a7&oe=5FEE13D7')
jaume.avatar.attach(io: avatar_jaume, filename: 'jaume.png', content_type: 'image/png')


p "Created #{User.count} users"

####################################################

Booking_1 = Booking.create(
  user_id: rocio.id,
  iteration_id: Iteration.all.sample.id,
  start_date: DateTime.new(2020,12,10,19),
  end_date: DateTime.new(2020,12,25,20),
  budget: 70,
  languages: ["spanish"],
  audiences: ["adults"],
  cancellation_insurance: false,
  exclude_category_ids: nil,
  city: "Barcelona",
  iteration: recent_iteration
)

Booking_2 = Booking.create(
  user_id: bruna.id,
  iteration_id: Iteration.all.sample.id,
  start_date: DateTime.new(2020,12,18,19),
  end_date: DateTime.new(2020,12,22,20),
  budget: 100,
  languages: ["spanish"],
  audiences: ["adults"],
  cancellation_insurance: false,
  exclude_category_ids: nil,
  city: "Barcelona",
)

Booking_3 = Booking.create(
  user_id: dani.id,
  iteration_id: Iteration.all.sample.id,
  start_date: DateTime.new(2020,12,12,19),
  end_date: DateTime.new(2020,12,31,20),
  budget: 120,
  languages: ["spanish"],
  audiences: ["adults"],
  cancellation_insurance: false,
  exclude_category_ids: nil,
  city: "Barcelona",
)

p "Created #{Booking.count} bookings"


###################################################

Review_1 = Review.create(
  booking_id: Booking_1.id,
  rating: 5,
  description: "Highly recommended app for those looking for something new and exciting! My surprise event was the fabulous new drag-production – A Dragatha Christie Murder Mystery ,and boy was that a fun night out!",
)

Review_2 = Review.create(
  booking_id: Booking_2.id,
  rating: 5,
  description: "Brilliant app! Helio assigns you a wonderful mystery event. If you like surprises and culture, this is the place for you. I was lucky enough to receive tickets for the fantastic Cuarteto Casals at the l'Auditori in Barcelona, and will definitely book again.",
)

Review_3 = Review.create(
  booking_id: Booking_3.id,
  rating: 5,
  description: "Never thought magic shows were my thing, but Helio proved me wrong! I really enjoyed watching the illusionist Daniel Collado, and will definitely return for more exciting Helio experiences. Highly recommended! ",
)

p "Created #{Review.count} reviews"


###################################################

qr = URI.open('https://images.unsplash.com/photo-1533777857889-4be7c70b33f7?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80')
event_8.photo.attach(io: event_8_photo, filename: 'event8.jpg', content_type: 'image/jpg')


####################################################



# create_table "iterations", force: :cascade do |t|
#   t.datetime "start_date"
#   t.integer "price"
#   t.bigint "event_id", null: false
# DateTime.new(2020,12,1,17))


# t.string "title"

#     t.text "description"
#     t.string "language"
#     t.string "address"
#     t.string "audience"
#     t.bigint "category_id", null: false
