require "open-uri"

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
    name: 'Shows',
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
    name: 'Classic',
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
  description: "You cannot miss El Mètode Grönnholm at the Teatre Poliorama. In 2003 The Grönholm method was premiered for the first time at the National Theater of Catalonia and since then it has crossed all borders: it has become a public success both in Catalonia, as in the rest of the State and in the international arena.",
  language: 'catalan',
  address: 'Ramblas, 115 (Barcelona)',
  audience: 'adults',
  category_id: Category.find_by(name:'Comedy').id
)

event_1_photo = URI.open('https://images.unsplash.com/photo-1585699324551-f6c309eedeca?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80')
event_1.photo.attach(io: event_1_photo, filename: 'event1.jpg', content_type: 'image/jpg')

recent_iteration = Iteration.create(event_id: event_1.id, price: 20, start_date: DateTime.new(2020,12,18,19))
Iteration.create(event_id: event_1.id, price: 20, start_date: DateTime.new(2020,12,19,17))

#########################

event_2 = Event.create(
  title:'Christmas with Toni Moog',
  description: "Toni Moog is coming home for Christmas to continue kicking his ass into the Christmas spirit after 12 consecutive successful seasons. Christmas with Toni Moog recalls, through his peculiar rogue style and without mincing words, the typical scenes of these very important days: celebratory dinners, gifts, invisible friends, Christmas carols, TV commercials, lottery, special television programming , nougats, polvorones, mantecados, grapes, bells, family, tambourines, zambombas, chaos, hangover...",
  language: 'spanish',
  address: 'Urquinaona, 9 (Barcelona)',
  audience: 'all ages',
  category_id: Category.find_by(name:'Theatre').id
)

event_2_photo = URI.open('https://www.tonimoog.com/wp-content/uploads/2020/03/FORTNIQUE-bcn.jpg')
event_2.photo.attach(io: event_2_photo, filename: 'event2.jpg', content_type: 'image/jpg')

Iteration.create(event_id: event_2.id, price: 22, start_date: DateTime.new(2020,12,20,17))
Iteration.create(event_id: event_2.id, price: 23, start_date: DateTime.new(2020,12,19,17))

#########################

event_3 = Event.create(
  title:'Nothing is impossible - Magician Pop',
  description: "Nothing is impossible is the show by Antonio Díaz, The Magician Pop, which arrives at the Theatre Victòria in Barcelona, ​​offering a journey through the extraordinary full of wonder, fun, sensitivity, surprises, rhythm and emotion, in an adventure full of illusions that confirms that when The Magician Pop is on stage, nothing is impossible!",
  language: 'spanish',
  address: 'Avda. Paral·lel, 67 (Barcelona)',
  audience: 'all ages',
  category_id: Category.find_by(name:'Magic').id
)

event_3_photo = URI.open('https://www.metropoliabierta.com/uploads/s1/66/21/13/magopop_9_1200x480.jpeg')
event_3.photo.attach(io: event_3_photo, filename: 'event3.jpg', content_type: 'image/jpg')

Iteration.create(event_id: event_3.id, price: 24, start_date: DateTime.new(2020,12,18,23))
Iteration.create(event_id: event_3.id, price: 24, start_date: DateTime.new(2020,12,19,10))

#########################

event_4 = Event.create(
  title:'Vermunólogos',
  description: "Watch out, the Vermunologists have arrived! A show of monologues, vermouth, tapas, music, improvisation, invited comedians ... All this at the Café Teatro Llantiol! Much more than a comedy show, this is a party!",
  language: 'spanish',
  address: 'Riereta, 7. (Barcelona)',
  audience: 'family',
  category_id: Category.find_by(name:'Monologues').id
)

event_4_photo = URI.open('https://cdn.atrapalo.com/common/photo/event/2/8/8/309/949457/vertic_880_0.jpg')
event_4.photo.attach(io: event_4_photo, filename: 'event4.jpg', content_type: 'image/jpg')

Iteration.create(event_id: event_4.id, price: 25, start_date: DateTime.new(2020,12,22,17))
Iteration.create(event_id: event_4.id, price: 25, start_date: DateTime.new(2020,12,21,19))

#########################

event_5 = Event.create(
  title:'Impro Show',
  description: "The actors, a stage and a box full of phrases written by the spectators. These are the main ingredients that open the door to Impro Show. The rest: creation, imagination, humor and a lot of reaction capacity. Discover the impro phenomenon in Teatreneu! Planeta Impro, creators of the “impro phenomenon” and national references of the best improvised humor, present the Impro Show. A fresh, original and interactive show!",
  language: 'spanish',
  address: 'Riereta, 7. (Barcelona)',
  audience: 'family',
  category_id: Category.find_by(name:'Improv').id
)

event_5_photo = URI.open('https://www.shbarcelona.es/blog/es/wp-content/uploads/2015/12/teatro-de-improvisaci%C3%B3n-en-barcelona-2.jpg')
event_5.photo.attach(io: event_5_photo, filename: 'event5.jpg', content_type: 'image/jpg')

Iteration.create(event_id: event_5.id, price: 26, start_date: DateTime.new(2020,12,25,17))
Iteration.create(event_id: event_5.id, price: 26, start_date: DateTime.new(2020,12,25,19))

#########################

event_6 = Event.create(
  title:'
  Emotions - Flamenco Show',
  description: "At the Madrid Flamenco Theater you will enjoy a unique experience: discovering the true essence of flamenco. It is the first theater dedicated exclusively to this genre, recognized as Intangible Heritage of Humanity by UNESCO. In order to bring flamenco to all audiences, in addition to concerts by renowned artists, it has in its daily schedule, from Monday to Sunday, with Emotions a show of singing, dancing and guitar with a cast of first-rate artists who visit the main flamenco styles. In the unique setting of a theater room and by candlelight, an atmosphere so intimate and welcoming that it recalls the mythical singing cafes awakens the magic that connects the spectator with the artist. Emotions is a different way of living and feeling flamenco. The Madrid Flamenco Theater is located in the popular and historic Malasaña neighborhood, a trendy area that concentrates vintage shops, bookstores, markets and bars located a few steps from the lively Gran Vía de Madrid. Just over two years after its opening, the Madrid Flamenco Theater is a benchmark in the capital's flamenco and cultural scene.",
  language: 'spanish',
  address: 'Calle del Pez, 10 (Madrid)',
  audience: 'adults',
  category_id: Category.find_by(name:'Dance').id
)
event_6_photo = URI.open('https://www.65ymas.com/uploads/s1/22/50/3/teatro-flamenco-de-madrid-sebastia-n-rocotovich-teatro-flamenco-madrid.jpeg')
event_6.photo.attach(io: event_6_photo, filename: 'event6.jpg', content_type: 'image/jpg')

Iteration.create(event_id: event_6.id, price: 27, start_date: DateTime.new(2020,12,17,19))
Iteration.create(event_id: event_6.id, price: 27, start_date: DateTime.new(2020,12,18,24))

#########################


event_7 = Event.create(
  title:'Sergio Dalma in concert',
  description: "Sergio Dalma takes the stage of the Auditori del Fòrum de Barcelona to present his new album 30… y tanto, an album that celebrates the 30-year career of one of the most iconic voices of our country. An album that includes a collection of 13 Sergio personally chosen classics that he now renews with his unmistakable style, elegance and class. To these classics are added three unreleased songs such as Donna, which was the advancement of the album celebrating 30 years of Sergio's career. A concert in which you can enjoy songs like This girl is mine, Galilea, Solo para ti or Bailar pasados, among others. Enjoy live the captivating broken voice of the Catalan singer!",
  language: 'spanish',
  address: 'Leonardo Da Vinci, s/n (Barcelona)',
  audience: 'adults',
  category_id: Category.find_by(name:'Concerts').id
)

event_7_photo = URI.open('https://static2.ideal.es/www/multimedia/201809/22/media/granada/GALERIA-sergio/PMZ210918sergio_dalma%200272.jpg')
event_7.photo.attach(io: event_7_photo, filename: 'event7.jpg', content_type: 'image/jpg')

Iteration.create(event_id: event_7.id, price: 28, start_date: DateTime.new(2020,12,20,19))
Iteration.create(event_id: event_7.id, price: 28, start_date: DateTime.new(2020,12,21,18))

#########################

event_8 = Event.create(
  title:'Aquarella Music Restaurant',
  description: "Give your palate and your soul this dinner with a musical show at Aquarella Music Restaurant! Aquarella is an experience, different, original, unique in Barcelona, ​​and above all personalized, where the treatment with the client is exclusive, creating an important link with the dinner and the show. The more than 10 artists on stage, 15 costume changes, live singers, masters of ceremonies, 4 set changes, will create the perfect setting for any special celebration. A show that surprises with innovation, creating a staging cared for down to the last detail and our dinner is made up of selected dishes from the Mediterranean diet, where you can enjoy the design and care of a fresh and elaborate product. A different experience from which you are always happy, let yourself be led to a new way of spending a unique evening. Any event or meeting is worth having a special appointment and for that Aquarella Music Restaurant is the ideal place to enjoy Mediterranean market cuisine, which together with its artistic team will create an unrepeatable moment full of surprises.",
  language: 'spanish',
  address: 'Gran Vía, 572 (Barcelona)',
  audience: 'adults',
  category_id: Category.find_by(name:'Show + Dinner').id
)

event_8_photo = URI.open('https://res.cloudinary.com/tf-lab/image/upload/restaurant/678e947e-ff4e-4a7d-bb94-2fbd505115d3/434d46da-8b19-4e68-baf5-853033ac2184.jpg')
event_8.photo.attach(io: event_8_photo, filename: 'event8.jpg', content_type: 'image/jpg')

Iteration.create(event_id: event_8.id, price: 21, start_date: DateTime.new(2020,12,24,19))
Iteration.create(event_id: event_8.id, price: 23, start_date: DateTime.new(2020,12,26,18))

#########################

event_9 = Event.create(
  title:'India Martínez- Guitar BCN Festival 2020',
  description: "Cordovan India Martínez faces the launch of her eighth album, Palmeras (Sony, 2019) with the determination of who knows that she has achieved her own place in music. In her almost 15-year career, India Martínez has not stopped touring, collaborating with top-level artists such as Pitingo, David Bisbal or Niña Pastori, and receiving awards, such as the Goya for the best song she got in 2015 for the film El Niño, by Daniel Monzón. With his own style halfway between melodic song and pop flamenco, Martínez has also known how to incorporate urban music without giving up its essence. In fact, her new job allows her to reconnect with her origins - she grew up in the Las Palmeras neighborhood of Córdoba - and become even more empowered thanks to songs like La gitana, her new success, which she describes as a battle cry for women and girls of all kinds we carry inside.",
  language: 'spanish',
  address: 'Leonardo Da Vinci, s/n (Barcelona)',
  audience: 'adults',
  category_id: Category.find_by(name:'Festivals').id
)

event_9_photo = URI.open('https://www.cadenadial.com/wp-content/uploads/2018/10/india-si-601x300.png')
event_9.photo.attach(io: event_9_photo, filename: 'event9.jpg', content_type: 'image/jpg')

Iteration.create(event_id: event_9.id, price: 25, start_date: DateTime.new(2020,12,17,19))
Iteration.create(event_id: event_9.id, price: 27, start_date: DateTime.new(2020,12,17,18))

#########################

event_10 = Event.create(
  title:'Callas in concert - In hologram',
  description: "An impressive show that has triumphed at the Pleyel Theater in Paris and that you can now enjoy at the Bankia Príncipe Pío Grand Theater, in which, as if by magic, María Callas returns to the stage radiant, with her unforgettable voice, thanks to the technique of the hologram. María Callas will return to the scene with a 3D technological feat developed by the United States company BASE Hologram, co-producer of the show, making the mythical lyrical singer appear again to the public as if she were there again, in the flesh. The show will be accompanied by the OSB, the Bankia Symphony Orchestra, with 20 live musicians who will perform the emblematic repertoire of María Callas while listening to her voice perfectly orchestrated with both the symphony and high technology.",
  language: 'spanish',
  address: 'Cuesta de San Vicente, 44 (Madrid)',
  audience: 'Adults',
  category_id: Category.find_by(name:'Classical Music + Opera').id
)

event_10_photo = URI.open('https://www.esmadrid.com/sites/default/files/eventos/eventos/callas.jpg')
event_10.photo.attach(io: event_10_photo, filename: 'event10.jpg', content_type: 'image/jpg')

Iteration.create(event_id: event_10.id, price: 24, start_date: DateTime.new(2020,12,27,19))
Iteration.create(event_id: event_10.id, price: 24, start_date: DateTime.new(2020,12,25,20))


p "Also created #{Event.count} Events with #{Iteration.count} Iterations"


####################################################

event_11 = Event.create(
  title:'Tinder Surprise - Andreu Casanova',
  description: "Nowadays, flirting is not what it used to be ... it's much better! Andreu Casanova invites you to go on a comic safari through the jungle of dating apps that are so fashionable in recent times. Tinder Surprise is a hilarious monologue that will change your mind about dating apps. You won't get tired of laughing with him! Don't be Swedish! It does not matter if you are single or in a relationship; surely you know how this new way of looking for love (or whatever arises) works. Do not worry: if you still have doubts, Andreu Casanova, through his own life experiences, will explain his funniest anecdotes and solve the most disturbing questions of virtual dating. Andreu Casanova returns to the stage after the success he achieved with the first and second parts of Fifty Shades of Andreu. Make a match and go to this appointment with humor at Arlequín Gran Vía Teatro!",
  language: 'spanish',
  address: 'C/ San Bernardo, 5 (Madrid)',
  audience: 'Adults',
  category_id: Category.find_by(name:'Monologues').id
)

event_11_photo = URI.open('https://cdn.atrapalo.com/common/photo/event/4/8/4/7654/1123422/vertic_880_0.jpg')
event_11.photo.attach(io: event_11_photo, filename: 'event11.jpg', content_type: 'image/jpg')

Iteration.create(event_id: event_11.id, price: 24, start_date: DateTime.new(2020,12,20,19))
Iteration.create(event_id: event_11.id, price: 21, start_date: DateTime.new(2020,12,21,20))

event_12 = Event.create(
  title:'The Cage of the Crazy',
  description: "Come and discover La caula de las locas, directed by and starring Àngel Llàcer. Don't miss this version of one of the most influential musicals in history. You can now buy your tickets before the last show on February 24. It is non-extendable! Life starts today! The peaceful life as a couple of Albin and Georges, owners of the La Cage aux Folles nightclub in Saint Tropez, is totally upset by unexpected news. Jean Michel, Georges' son, is going to marry the daughter of an ultra-conservative deputy, a staunch defender of the most traditional values ​​in family life. The explosive meeting between two very different families unleashes a hilarious comedy full of love and delusional situations. Inspired by the popular work of Jean Poiret, the musical is the fruit of the talents of Jerry Herman and Harvey Fierstein. With nine Tony Awards and three Drama Desk Awards, La Jaula de las Locas has been performed uninterruptedly around the world since its premiere. This season, it arrives at the Tívoli Theater in a spectacular version directed by Àngel Llàcer and Manu Guix. La Cage de las Locas is a great hymn to individual and collective freedom. A daring staging, striking choreography, exuberant costume design and a universal theme make it one of the most acclaimed musicals in history. Each performance transforms La Cage into a party, a celebration of the joie de vivre that you know how it begins, but never how it ends!",
  language: 'spanish',
  address: 'Caspe, 12 (Barcelona)',
  audience: 'Adults',
  category_id: Category.find_by(name:'Dance').id
)

event_12_photo = URI.open('https://cdn.atrapalo.com/common/photo/event/4/8/1/2601/901036/vertic_880_0.jpg')
event_12.photo.attach(io: event_12_photo, filename: 'event12.jpg', content_type: 'image/jpg')

Iteration.create(event_id: event_12.id, price: 24, start_date: DateTime.new(2020,12,21,20))
Iteration.create(event_id: event_12.id, price: 24, start_date: DateTime.new(2020,12,22,20))


event_13 = Event.create(
  title:'Escape Room in Madrid',
  description: "Don't miss shows like the Escape Room at the Figaro Theater. Escape Room, a comedy by Joel Joan and Héctor Claramunt, with Antonio Molero, Leo Rivera, Kira Miró and Marina San José. Leaving Escape Room will not be easy at all and the game will turn into a hell that will test friendship to unsuspected limits. Although it may not seem like it ... A scary comedy!",
  language: 'spanish',
  address: 'Doctor Cortezo, 5 (Madrid)',
  audience: 'Adults',
  category_id: Category.find_by(name:'Theatre').id
)

event_13_photo = URI.open('https://cdn.atrapalo.com/common/photo/event/4/8/4/0564/1084229/vertic_880_0.jpg')
event_13.photo.attach(io: event_13_photo, filename: 'event13.jpg', content_type: 'image/jpg')

Iteration.create(event_id: event_13.id, price: 24, start_date: DateTime.new(2020,12,24,20))
Iteration.create(event_id: event_13.id, price: 26, start_date: DateTime.new(2020,12,25,20))


event_14 = Event.create(
  title:'Turandot, Gran Liceu',
  description: "Exactly twenty years after the reopening of the Liceu (October 7, 1999) we collaborated on the Opera Turandot by Franc Aleu, one of the best operas of all time, the last and posthumous opera by Giacomo Puccini. We’ve produced several LED costumes designed by Chu Uroz and also we’ve been taking care of the whole Audivisual technical setup and other multimedia elements like Robots arms controlled with a custom app developed adhoc. A visually fascinating spectacle in his scenographic conception, Franc Aleu’s debut as a stage director, and with a self-illuminated costume with LED technology, where light plays a fundamental role in the service of a late-day and innovative opera in many aspects, achieved through a great technological deployment in which robotics, visuals and interactivity intertwine to narrate the bloodthirsty legend of Turandot. The “ice princess” returns to the Rambla theater under the skin of the great Iréne Theorin in the first cast and Lise Lindstrom in the second. Next to her, Jorge de León, Gregory Kunde, Ermonela Jaho and Anita Hartig in two luxury deals",
  language: 'spanish',
  address: 'La Rambla, 51 (Barcelona)',
  audience: 'Adults',
  category_id: Category.find_by(name:'Classical Music + Opera').id
)

event_14_photo = URI.open('https://eyesbergstudio.files.wordpress.com/2019/12/zentauroepp50295998-icult-turandot-liceu191007230028-1570482203442.jpg')
event_14.photo.attach(io: event_14_photo, filename: 'event14.jpg', content_type: 'image/jpg')

Iteration.create(event_id: event_14.id, price: 30, start_date: DateTime.new(2020,12,18,23))
Iteration.create(event_id: event_14.id, price: 28, start_date: DateTime.new(2020,12,19,10))


event_15 = Event.create(
  title:'Carlos Latre - One Show Man',
  description: "The best imitator in the country, Carlos Latre, begins his tour by presenting One Man Show, a monologue that reviews all the current affairs of the country through brilliant imitations of current characters. Reserve your place at the Teatre Coliseum now! Carlos Latre manages, in just 75 minutes, to imitate up to 100 different characters. A real madness! Messi, Pedro Sánchez, Salvador Illa ... And of course, also the most mediatic character of the moment, Fernando Simón! Carlos Latre unfolds into countless people creating unimaginable parodies, which keeps the viewer on the brink of collapse. Let it surprise you! Live the Carlos Latre monologue, a true show that will fill you with energy, creativity and good vibes.",
  language: 'spanish',
  address: 'Gran Vía, 595 (Barcelona)',
  audience: 'Adults',
  category_id: Category.find_by(name:'Theatre').id
)

event_15_photo = URI.open('https://cdn.atrapalo.com/common/photo/event/4/8/5/2040/1159245/vertic_880_0.jpg')
event_15.photo.attach(io: event_15_photo, filename: 'event15.jpg', content_type: 'image/jpg')

Iteration.create(event_id: event_15.id, price: 27, start_date: DateTime.new(2020,12,18,22))
Iteration.create(event_id: event_15.id, price: 24, start_date: DateTime.new(2020,12,19,17))


event_16 = Event.create(
  title:'The function that goes wrong',
  description: "The best imitator in the country, Carlos Latre, begins his tour by presenting One Man Show, a monologue that reviews all the current affairs of the country through brilliant imitations of current characters. Reserve your place at the Teatre Coliseum now! Carlos Latre manages, in just 75 minutes, to imitate up to 100 different characters. A real madness! Messi, Pedro Sánchez, Salvador Illa ... And of course, also the most mediatic character of the moment, Fernando Simón! Carlos Latre unfolds into countless people creating unimaginable parodies, which keeps the viewer on the brink of collapse. Let it surprise you! Live the Carlos Latre monologue, a true show that will fill you with energy, creativity and good vibes.",
  language: 'spanish',
  address: 'Gran Vía, 595 (Barcelona)',
  audience: 'Adults',
  category_id: Category.find_by(name:'Theatre').id
)

event_16_photo = URI.open('https://cdn.atrapalo.com/common/photo/event/4/8/4/7455/1122333/vertic_880_0.jpg')
event_16.photo.attach(io: event_16_photo, filename: 'event15.jpg', content_type: 'image/jpg')

Iteration.create(event_id: event_16.id, price: 24, start_date: DateTime.new(2020,12,18,22))
Iteration.create(event_id: event_16.id, price: 21, start_date: DateTime.new(2020,12,19,17))

###################################################

avatar_ana = URI.open('https://ca.slack-edge.com/T02NE0241-U01C47C1XGD-335755276214-512')
ana = User.create!(email: "ana@gmail.com", password: "password", first_name: "Ana", last_name: "Bajo")
ana.avatar.attach(io: avatar_ana, filename: 'ana.png', content_type: 'image/png')

rocio = User.create!(email: 'rocio@gmail.com', password: 'password', first_name: "Rocio", last_name:"Nadal")
avatar_rocio = URI.open('https://media-exp1.licdn.com/dms/image/C4D03AQHWSUqNdAXHcQ/profile-displayphoto-shrink_800_800/0/1596640241152?e=1620864000&v=beta&t=OH0Zphp2p76o3iLBW-Y4wCTjUjLSnzRFk8_sWtusbjo')
rocio.avatar.attach(io: avatar_rocio, filename: 'rocio.png', content_type: 'image/png')

dani = User.create!(email: "dani@gmail.com", password: "password", first_name: "Dani", last_name: "Diestre")
avatar_dani = URI.open('https://ca.slack-edge.com/T02NE0241-U01CKUGMDEV-d53a4bd83b10-512')
dani.avatar.attach(io: avatar_dani, filename: 'dani.png', content_type: 'image/png')

bruna = User.create!(email: "bruna@gmail.com", password: "password", first_name: "Bruna", last_name: "Scopel")
avatar_bruna = URI.open('https://ca.slack-edge.com/T02NE0241-U01BSHLR831-4e61fbb19976-512')
bruna.avatar.attach(io: avatar_bruna, filename: 'bruna.png', content_type: 'image/png')

jaume = User.create!(email: "jaume@gmail.com", password: "password", first_name: "Jaume", last_name: "Ros")
avatar_jaume = URI.open('https://ca.slack-edge.com/T02NE0241-U01BSHLTVF1-ae88ef3453a5-512')
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
  user_id: jaume.id,
  iteration_id: event_9.iterations.first.id,
  start_date: DateTime.new(2020,12,16,19),
  end_date: DateTime.new(2020,12,18,19),
  budget: 40,
  languages: ["spanish"],
  audiences: ["adults"],
  cancellation_insurance: false,
  exclude_category_ids: nil,
  city: "Barcelona",
)

Booking_4 = Booking.create(
  user_id: jaume.id,
  iteration_id: event_3.iterations.first.id,
  start_date: DateTime.new(2020,12,16,19),
  end_date: DateTime.new(2020,12,18,19),
  budget: 40,
  languages: ["spanish"],
  audiences: ["adults"],
  cancellation_insurance: false,
  exclude_category_ids: nil,
  city: "Barcelona",
  participants: 2,
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

p "Created #{Review.count} reviews"

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
