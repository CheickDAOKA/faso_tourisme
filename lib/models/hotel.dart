class Hotel {
  final String id;
  final String name;
  final String description;
  final String fullDescription;
  final String imageUrl;
  final double stars;
  final double rating;
  final int pricePerNight;
  final String location;
  final bool isAvailable;
  final List<String> tags;

  Hotel({
    required this.id,
    required this.name,
    required this.description,
    required this.fullDescription,
    required this.imageUrl,
    required this.stars,
    required this.rating,
    required this.pricePerNight,
    required this.location,
    required this.isAvailable,
    required this.tags,
  });

  static List<Hotel> getAllHotels() {
    return [

      // ── OUAGADOUGOU ──────────────────────────────────────────────
      // Sites proches : Parc Bangr Weogo, Mémorial Thomas Sankara,
      //                 Musée national, Mare aux crocodiles de Sabou

      Hotel(
        id: 'h1',
        name: 'Azalaï Hôtel Ouagadougou',
        description: 'Hôtel 4 étoiles au cœur de Ouagadougou, idéal affaires et tourisme.',
        fullDescription:
        'L\'Azalaï Hôtel Ouagadougou est un établissement 4 étoiles situé en plein centre-ville, à quelques minutes du Musée national et de la Place des Cinéastes. Il propose 176 chambres, un centre de conférences, une piscine, un spa, deux bars et un restaurant gastronomique. Parfait point de départ pour explorer le Parc Bangr Weogo ou le Mémorial Thomas Sankara.',
        imageUrl:'https://lh3.googleusercontent.com/gps-cs-s/AHVAweoOVn944WQgLXDMv3LWsFgSPH5N1o6fBZfqjLMSvVtpwr6rLb922cd9LANmwUu5yHaaRAiaaOa7_OoYfUC2GapN38_KlDMFvN_iPvXpPeqIRv1UGu9i6i64tTeGEph2zNvVRak=s680-w680-h510-rw',
        stars: 4,
        rating: 4.4,
        pricePerNight: 90000,
        location: 'Ouagadougou, Centre',
        isAvailable: true,
        tags: ['Piscine', 'Spa', 'Centre-ville'],
      ),
      Hotel(
        id: 'h2',
        name: 'Sopatel Silmandé',
        description: 'Hôtel 4 étoiles avec vue sur le lac, à 2 km du centre.',
        fullDescription:
        'Le Sopatel Silmandé est un hôtel emblématique de Ouagadougou, perché au bord du lac et entouré d\'un grand parc arboré. À 8 étages, il offre une vue panoramique sur la ville. Il dispose d\'une piscine, d\'un restaurant, d\'un bar et de salles de conférence. Proche du Musée national et du Mémorial Thomas Sankara.',
        imageUrl:
        'https://images.unsplash.com/photo-1564501049412-61c2a3083791?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&q=80&w=1080',
        stars: 4,
        rating: 4.2,
        pricePerNight: 75000,
        location: 'Ouagadougou, Centre',
        isAvailable: true,
        tags: ['Vue lac', 'Parc', 'Conférence'],
      ),
      Hotel(
        id: 'h3',
        name: 'Lancaster Ouaga 2000',
        description: 'Hôtel 4 étoiles moderne dans le quartier résidentiel Ouaga 2000.',
        fullDescription:
        'Le Lancaster Ouaga 2000 est un hôtel de standing situé dans le prestigieux quartier Ouaga 2000, à 5 km du centre-ville. Avec 231 chambres, une piscine, un jacuzzi, un restaurant et des services haut de gamme, c\'est l\'adresse préférée des voyageurs d\'affaires et des touristes exigeants. Idéal pour visiter le Parc animalier de Ziniaré.',
        imageUrl:
        'https://images.unsplash.com/photo-1520250497591-112f2f40a3f4?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&q=80&w=1080',
        stars: 4,
        rating: 4.3,
        pricePerNight: 85000,
        location: 'Ouaga 2000, Ouagadougou',
        isAvailable: true,
        tags: ['Piscine', 'Luxe', 'Ouaga 2000'],
      ),
      Hotel(
        id: 'h4',
        name: 'Bravia Hotel Ouagadougou',
        description: 'Hôtel 4 étoiles moderne proche de l\'aéroport.',
        fullDescription:
        'Le Bravia Hotel est un établissement contemporain de 107 chambres construit en 2014, idéalement situé dans le quartier ZACA. Il offre une piscine, un jacuzzi, un spa, un restaurant, un bar et un parking valet. À quelques minutes du Musée national du Burkina Faso et du Parc Bangr Weogo.',
        imageUrl:
        'https://images.unsplash.com/photo-1566073771259-6a8506099945?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&q=80&w=1080',
        stars: 4,
        rating: 4.1,
        pricePerNight: 80000,
        location: 'Quartier ZACA, Ouagadougou',
        isAvailable: true,
        tags: ['Aéroport', 'Piscine', 'Spa'],
      ),
      Hotel(
        id: 'h5',
        name: 'Hôtel Palm Beach Ouagadougou',
        description: 'Hôtel 3 étoiles en plein centre-ville avec piscine.',
        fullDescription:
        'L\'Hôtel Palm Beach est un établissement 3 étoiles situé en plein centre de Ouagadougou. Il dispose d\'une piscine extérieure, d\'un restaurant, d\'un bar et du Wi-Fi gratuit. Une adresse prisée pour son bon rapport qualité-prix et sa proximité avec les principales attractions de la capitale.',
        imageUrl:
        'https://images.unsplash.com/photo-1571003123894-1f0594d2b5d9?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&q=80&w=1080',
        stars: 3,
        rating: 3.8,
        pricePerNight: 45000,
        location: 'Ouagadougou, Centre',
        isAvailable: false,
        tags: ['Piscine', 'Centre-ville', 'Rapport qualité-prix'],
      ),
      Hotel(
        id: 'h6',
        name: 'Le Karité Bleu',
        description: 'Charmante maison d\'hôtes dans un jardin tropical.',
        fullDescription:
        'Le Karité Bleu est une maison d\'hôtes de charme nichée dans un beau jardin tropical au cœur de Ouagadougou. Seules 3 chambres disponibles, gérée par un propriétaire passionné — c\'est le lieu favori des voyageurs en quête d\'authenticité. Excellent restaurant sur place. Idéal pour rayonner vers le Mémorial Thomas Sankara et le Musée national.',
        imageUrl:
        'https://images.unsplash.com/photo-1493809842364-78817add7ffb?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&q=80&w=1080',
        stars: 3,
        rating: 4.5,
        pricePerNight: 35000,
        location: 'Ouagadougou, Centre',
        isAvailable: true,
        tags: ['Maison d\'hôtes', 'Jardin', 'Authentique'],
      ),

      // ── BOBO-DIOULASSO ───────────────────────────────────────────
      // Sites proches : Grande Mosquée, Guinguette forêt de Kou

      Hotel(
        id: 'h7',
        name: 'L\'Auberge de Bobo-Dioulasso',
        description: 'Hôtel de charme dans une villa soudanaise historique.',
        fullDescription:
        'L\'Auberge est construite autour d\'une villa historique représentative du style soudanais occidental. Idéalement située dans le quartier administratif de Bobo-Dioulasso, elle propose des chambres confortables, une piscine, un restaurant réputé et un bar. Un incontournable pour visiter la Grande Mosquée et la Guinguette de la forêt de Kou.',
        imageUrl:
        'https://images.unsplash.com/photo-1578683010236-d716f9a3f461?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&q=80&w=1080',
        stars: 3,
        rating: 4.6,
        pricePerNight: 40000,
        location: 'Bobo-Dioulasso, Hauts-Bassins',
        isAvailable: true,
        tags: ['Charme', 'Piscine', 'Restaurant'],
      ),
      Hotel(
        id: 'h8',
        name: 'Villa Bobo',
        description: 'Villa avec piscine et jardin, cadre reposant à Bobo.',
        fullDescription:
        'La Villa Bobo est un hébergement chaleureux avec piscine, jardin et terrasse à Bobo-Dioulasso. Le personnel est réputé pour son accueil exceptionnel et la cuisine est excellente. Parfait pour explorer la Grande Mosquée et les marchés animés de la ville, ainsi que pour rayonner vers la Guinguette de la forêt de Kou à 21 km.',
        imageUrl:
        'https://images.unsplash.com/photo-1512918728675-ed5a9ecdebfd?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&q=80&w=1080',
        stars: 3,
        rating: 4.7,
        pricePerNight: 38000,
        location: 'Bobo-Dioulasso, Hauts-Bassins',
        isAvailable: true,
        tags: ['Villa', 'Piscine', 'Jardin'],
      ),
      Hotel(
        id: 'h9',
        name: 'Hôtel Dioulassoba',
        description: 'Hôtel confortable avec spa au cœur de Bobo.',
        fullDescription:
        'L\'Hôtel Dioulassoba est un établissement moderne au cœur de Bobo-Dioulasso offrant des services haut de gamme dont un spa, des chambres climatisées et un restaurant. Son nom rend hommage au quartier historique de Dioulassoba, à deux pas de la Grande Mosquée.',
        imageUrl:
        'https://images.unsplash.com/photo-1517840901100-8179e982acb7?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&q=80&w=1080',
        stars: 3,
        rating: 4.2,
        pricePerNight: 42000,
        location: 'Bobo-Dioulasso, Hauts-Bassins',
        isAvailable: false,
        tags: ['Spa', 'Mosquée proche', 'Confort'],
      ),

      // ── BANFORA / CASCADES ───────────────────────────────────────
      // Sites proches : Cascades de Karfiguéla, Pics de Sindou,
      //                 Lac de Tangréla, Dômes de Fabedougou

      Hotel(
        id: 'h10',
        name: 'Campement de Banfora',
        description: 'Hébergement écotouristique au cœur de la région des Cascades.',
        fullDescription:
        'Le Campement de Banfora est un établissement écotouristique de 17 chambres climatisées, idéalement situé pour explorer les merveilles de la région. À moins de 10 km des Cascades de Karfiguéla, du Lac de Tangréla et des Dômes de Fabedougou. Ambiance authentique, cuisine locale et guides disponibles pour les excursions.',
        imageUrl:
        'https://images.unsplash.com/photo-1493809842364-78817add7ffb?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&q=80&w=1080',
        stars: 2,
        rating: 4.0,
        pricePerNight: 25000,
        location: 'Banfora, Cascades',
        isAvailable: true,
        tags: ['Écotourisme', 'Cascades', 'Guides'],
      ),
      Hotel(
        id: 'h11',
        name: 'Hôtel Le Comoé',
        description: 'Hôtel simple et bien situé à Banfora.',
        fullDescription:
        'L\'Hôtel Le Comoé est un établissement confortable et bien situé à Banfora, la capitale de la région des Cascades. Ses chambres climatisées et son restaurant en font une base idéale pour rayonner vers les Cascades de Karfiguéla, les Pics de Sindou et les Dômes de Fabedougou. Personnel accueillant et tarifs abordables.',
        imageUrl:
        'https://images.unsplash.com/photo-1598928506311-c55ded91a20c?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&q=80&w=1080',
        stars: 2,
        rating: 3.7,
        pricePerNight: 22000,
        location: 'Banfora, Cascades',
        isAvailable: true,
        tags: ['Économique', 'Cascades', 'Pics de Sindou'],
      ),

      // ── TIÉBÉLÉ / GAOUA ─────────────────────────────────────────
      // Sites proches : Cour Royale de Tiébélé, Ruines de Loropéni,
      //                 Grotte de Diébougou

      Hotel(
        id: 'h12',
        name: 'Auberge de Tiébélé',
        description: 'Auberge authentique aux portes du village Kasséna.',
        fullDescription:
        'L\'Auberge de Tiébélé est un petit hébergement de charme situé à l\'entrée du célèbre village Kasséna aux murs peints. C\'est le seul hébergement sur place, idéal pour visiter la Cour Royale tôt le matin avant les foules. Chambres simples, repas locaux et ambiance authentique garantie.',
        imageUrl:
        'https://images.unsplash.com/photo-1630660664869-c9d3cc676880?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&q=80&w=1080',
        stars: 2,
        rating: 4.1,
        pricePerNight: 18000,
        location: 'Tiébélé, Centre-Sud',
        isAvailable: true,
        tags: ['Kasséna', 'Authentique', 'Peintures murales'],
      ),
      Hotel(
        id: 'h13',
        name: 'Hôtel de Gaoua',
        description: 'Hôtel de référence à Gaoua, proche des Ruines de Loropéni.',
        fullDescription:
        'L\'Hôtel de Gaoua est l\'établissement de référence dans la capitale du Poni. Il dispose de 14 chambres climatisées, d\'un restaurant et d\'un parking sécurisé. Idéalement situé pour visiter les Ruines de Loropéni (site UNESCO) et la Grotte de Diébougou, à moins d\'une heure de route.',
        imageUrl:
        'https://images.unsplash.com/photo-1618773928121-c32242e63f39?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&q=80&w=1080',
        stars: 2,
        rating: 3.6,
        pricePerNight: 20000,
        location: 'Gaoua, Sud-Ouest',
        isAvailable: false,
        tags: ['UNESCO', 'Loropéni', 'Grottes'],
      ),

      // ── ZINIARÉ ──────────────────────────────────────────────────
      // Sites proches : Parc animalier de Ziniaré, Mare aux crocodiles

      Hotel(
        id: 'h14',
        name: 'Hôtel de l\'Amitié Ziniaré',
        description: 'Hôtel fonctionnel à 30 km de Ouagadougou.',
        fullDescription:
        'L\'Hôtel de l\'Amitié à Ziniaré est un établissement pratique et bien équipé, situé à 30 km de Ouagadougou. C\'est la base idéale pour visiter le Parc animalier de Ziniaré et la Mare aux crocodiles sacrés de Sabou. Chambres climatisées, Wi-Fi et restaurant sur place.',
        imageUrl:
        'https://images.unsplash.com/photo-1455587734955-081b22074882?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&q=80&w=1080',
        stars: 2,
        rating: 3.5,
        pricePerNight: 19000,
        location: 'Ziniaré, Plateau-Central',
        isAvailable: true,
        tags: ['Zoo', 'Crocodiles', 'Excursion'],
      ),
    ];
  }
}