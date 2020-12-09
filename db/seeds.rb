# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
require "open-uri"
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Iteration.destroy_all
Event.destroy_all
Category.destroy_all
User.destroy_all


categories_array = ['Theatre', 'Monologues', 'Comedy','Magic', 'Improv','Dance', 'Show + Dinner', 'Concerts', 'Festivals', 'Classical Music and Opera', ]

categories_array.each do |category|
  Category.create(name: category)
end

p "Created #{Category.count} categories"


#########################


Event_1 = Event.create(

  title:'El Mètode Grönnholm',
  description: "No te puedes perder El Mètode Grönnholm en el Teatre Poliorama.En el año 2003 El método Grönholm se estrenó por primera vez en el Teatro Nacional de Cataluña y desde entonces ha traspasado todas las fronteras: se ha convertido en un éxito de público tanto en Cataluña, como en el resto del Estado como en el ámbito internacional.",
  language: 'Catalan',
  address: 'Ramblas, 115 (Barcelona)',
  audience: 'Adults',
  category_id: Category.find_by(name:'Comedy').id
)

Iteration.create(event_id: Event_1.id, price: 10, start_date: DateTime.new(2020,12,25,17))

Iteration.create(event_id: Event_1.id, price: 15, start_date: DateTime.new(2020,12,24,17))

#########################


Event_2 = Event.create(

  title:'Navidad con Toni Moog',
  description: "Toni Moog vuelve a casa por Navidad para seguir pateando el culo al espíritu navideño tras 12 temporadas consecutivas de éxito.

Navidad con Toni Moog rememora, a través de su peculiar estilo canalla y sin pelos en la lengua, las típicas escenas de estos días tan señalados: cenas de celebración, regalos, amigos invisibles, villancicos, anuncios de TV, lotería, programación especial de televisión, turrones, polvorones, mantecados, uvas, campanadas, familia, panderetas, zambombas, desmadre, resaca…",
  language: 'Español',
  address: 'Urquinaona, 9 (Barcelona)',
  audience: 'All ages',
  category_id: Category.find_by(name:'Theatre').id
)

Iteration.create(event_id: Event_2.id, price: 18, start_date: DateTime.new(2021,1,25,17))

Iteration.create(event_id: Event_2.id, price: 23, start_date: DateTime.new(2021,1,23,17))


#########################

Event_3 = Event.create(

  title:'Nada es imposible - Mago Pop',
  description: "Nada es imposible es el espectáculo de Antonio Díaz, El Mago Pop, que llega al Teatre Victòria de Barcelona, ofreciendo un viaje por lo extraordinario lleno de asombro, diversión, sensibilidad, sorpresas, ritmo y emoción, en una aventura llena de ilusiones que confirma que, cuando El Mago Pop está en escena, ¡nada es imposible!",
  language: 'Español',
  address: 'Avda. Paral·lel, 67 (Barcelona)',
  audience: 'All ages',
  category_id: Category.find_by(name:'Magic').id
)

Iteration.create(event_id: Event_3.id, price: 31, start_date: DateTime.new(2021,1,10,17))

Iteration.create(event_id: Event_3.id, price: 31, start_date: DateTime.new(2021,1,12,17))

#########################

Event_4 = Event.create(

  title:'Vermunólogos',
  description: "¡Cuidado, han llegado los Vermunólogos! Un show de monólogos, vermut, tapeo, música, improvisación, cómicos invitados... ¡Todo esto en el Café Teatro Llantiol! Mucho más que una función de comedia, ¡Esto es una fiesta!",
  language: 'Español',
  address: 'Riereta, 7. (Barcelona)',
  audience: '16 +',
  category_id: Category.find_by(name:'Monologues').id
)

Iteration.create(event_id: Event_4.id, price: 8, start_date: DateTime.new(2021,1,5,17))

Iteration.create(event_id: Event_4.id, price: 9, start_date: DateTime.new(2021,1,5,19))

#########################

Event_5 = Event.create(

  title:'Impro Show',
  description: "Los actores, un escenario y una caja repleta de frases escritas por los espectadores. Estos son los ingredientes principales que abren la puerta a Impro Show. El resto: creación, imaginación, humor y mucha capacidad de reacción. ¡Descubre el fenómeno impro en Teatreneu!

Planeta Impro, creadores del “fenómeno impro” y referentes a nivel nacional del mejor humor improvisado, presentan Impro Show. Un espectáculo fresco, original y interactivo!",
  language: 'Español',
  address: 'Riereta, 7. (Barcelona)',
  audience: '14 +',
  category_id: Category.find_by(name:'Improv').id
)

Iteration.create(event_id: Event_5.id, price: 8, start_date: DateTime.new(2021,2,5,17))

Iteration.create(event_id: Event_5.id, price: 9, start_date: DateTime.new(2021,2,5,19))


#########################

Event_6 = Event.create(
  title:'Emociones - Espectáculo flamenco',
  description: "En el Teatro Flamenco Madrid disfrutarás de una experiencia única: descubrir la auténtica esencia del flamenco. Es el primer teatro dedicado en exclusiva a este género reconocido Patrimonio Inmaterial de la Humanidad por la UNESCO. Con el propósito de acercar el flamenco a todos los públicos, además de conciertos de reconocidos artistas, cuenta en su programación diaria, de lunes a domingo, con Emociones un espectáculo de cante, baile y guitarra con un elenco de artistas de primer nivel que recorren los principales estilos del flamenco. En el marco único de la sala de un teatro y a la luz de las velas, un ambiente tan íntimo y acogedor que recuerda a los míticos cafés cantantes despierta la magia que conecta al espectador con el artista. Emociones es una manera diferente de vivir y sentir el flamenco. El Teatro Flamenco Madrid se encuentra en el popular e histórico barrio de Malasaña, zona de tendencias que concentra tiendas vintage, librerías, mercadillos y bares situados a escasos pasos de la animada Gran Vía de Madrid. A poco más de dos años de su apertura, el Teatro Flamenco Madrid es un referente de la escena cultural y flamenca de la capital.",
  language: 'Spanish',
  address: 'Calle del Pez, 10 (Madrid)',
  audience: 'Adults',
  category_id: Category.find_by(name:'Dance').id
)
Iteration.create(event_id: Event_6.id, price: 18, start_date: DateTime.new(2020,12,10,19))

Iteration.create(event_id: Event_6.id, price: 20, start_date: DateTime.new(2020,12,10,24))

#########################


Event_7 = Event.create(
  title:'Sergio Dalma, en concierto',
  description: "Sergio Dalma se sube al escenario del Auditori del Fòrum de Barcelona para presentar su nuevo disco 30… y tanto, un álbum que celebra los 30 años de carrera de una de las voces más icónicas de nuestro país.Un disco que recoge una colección de 13 clásicos elegidos personalmente Sergio y que ahora renueva con su inconfundible estilo, elegancia y clase. A estos clásicos se suman tres temas inéditos como Donna que fue el adelanto del álbum de celebración de los 30 años de la carrera de Sergio. Un concierto en el que podrás disfrutar de canciones como Esta chica es mía, Galilea, Solo para ti o Bailar pegados, entre otros. ¡Disfruta en directo de la cautivora voz rota del cantante de catalán!",
  language: 'Español',
  address: 'Leonardo Da Vinci, s/n (Barcelona)',
  audience: 'Adults',
  category_id: Category.find_by(name:'Concerts').id
)
Iteration.create(event_id: Event_7.id, price: 25, start_date: DateTime.new(2020,12,17,19))
Iteration.create(event_id: Event_7.id, price: 40, start_date: DateTime.new(2020,12,18,18))

#########################

Event_8 = Event.create(
  title:'Aquarella Music Restaurant',
  description: "¡Regala a tu paladar y a tu alma esta cena con espectáculo musical en Aquarella Music Restaurant! Aquarella es una experiencia, diferente, original, única en Barcelona, y sobre todo personalizada, donde el trato con el cliente es exclusivo creando un vínculo importante con la cena y el espectáculo. Los más de 10 artistas en el escenario, 15 cambios de vestuario, cantantes en directo, maestros de ceremonias, 4 cambios de escenografía, crearán el entorno perfecto para cualquier celebración especial. Un espectáculo que sorprende por la innovación, creando una puesta en escena cuidada hasta el último detalle y nuestra cena se compone de platos seleccionados de la dieta mediterránea, donde podrán disfrutar del diseño y cuidado de un producto fresco y elaborado. Una experiencia diferente de la que siempre se sale contento, déjate llevar hacia una nueva forma de pasar una velada única. Cualquier evento o reunión es digno de tener una cita especial y para eso Aquarella Music Restaurant es el lugar idóneo para disfrutar de una cocina mediterránea de mercado, que junto a su equipo artístico crearán un momento irrepetible lleno de sorpresas.",
  language: 'Español',
  address: 'Gran Vía, 572 (Barcelona)',
  audience: 'Adults',
  category_id: Category.find_by(name:'Show + Dinner').id
)
Iteration.create(event_id: Event_8.id, price: 25, start_date: DateTime.new(2020,12,10,19))
Iteration.create(event_id: Event_8.id, price: 40, start_date: DateTime.new(2020,12,16,18))

#########################


Event_9 = Event.create(
  title:'India Martínez- Guitar BCN Festival 2020',
  description: "La cordobesa India Martínez afronta el lanzamiento de su octavo disco, Palmeras (Sony, 2019) con la determinación de quien sabe que ha conseguido un lugar propio en la música. En sus casi 15 años de carrera, India Martínez no ha parado de girar, de colaborar con artistas de primer nivel como Pitingo, David Bisbal o Niña Pastori, y de recibir premios, como el Goya a la mejor canción que consiguió en 2015 para la película El Niño, de Daniel Monzón. Con un estilo propio a medio camino entre la canción melódica y el flamenco pop, Martínez también ha sabido incorporar las músicas urbanas sin renunciar a su esencia. De hecho, su nuevo trabajo le permite reconectar con sus orígenes -le creció en el barrio de Las Palmeras, de Córdoba- y empoderarse aún más gracias canciones como La gitana, su nuevo éxito, que ella describe como un grito de guerra que mujeres y niñas de todo tipo llevamos dentro",
  language: 'Español',
  address: 'Leonardo Da Vinci, s/n (Barcelona)',
  audience: 'Adults',
  category_id: Category.find_by(name:'Festivals').id
)
Iteration.create(event_id: Event_9.id, price: 45, start_date: DateTime.new(2020,12,20,19))
Iteration.create(event_id: Event_9.id, price: 50, start_date: DateTime.new(2020,12,19,18))

#########################

Event_10 = Event.create(
  title:'Callas en concierto - En holograma',
  description: "Un espectáculo impactante que ha triunfado en el Teatro Pleyel de París y que ahora podrás disfrutar en el Gran Teatro Bankia Príncipe Pío, en el que como por arte de magia, María Callas vuelve a escena radiante, con su inolvidable voz, gracias a la técnica del holograma. María Callas volverá a escena con una proeza tecnológica en 3D desarrollada por la empresa de Estados Unidos BASE Hologram, co productora del show, consiguiendo que la mítica cantante lírica se muestre nuevamente al público como si estuviera allí de nuevo, en carne y hueso. El show irá acompañado por la OSB, la Orquesta Sinfónica de Bankia, con 20 músicos en directo que interpretarán el emblemático repertorio de María Callas mientras se escucha su voz perfectamente orquestada tanto con la sinfónica como con la alta tecnología.",
  language: 'Español',
  address: 'Cuesta de San Vicente, 44 (Madrid)',
  audience: 'Adults',
  category_id: Category.find_by(name:'Classical Music and Opera').id
)
Iteration.create(event_id: Event_10.id, price: 69, start_date: DateTime.new(2020,12,19,19))
Iteration.create(event_id: Event_10.id, price: 50, start_date: DateTime.new(2020,12,18,20))



p "Also created #{Event.count} Events with #{Iteration.count} Iterations"




##########################################

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
