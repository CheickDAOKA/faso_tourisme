class Place {
  final String id;
  final String category;
  final String name;
  final String description;
  final String fullDescription;
  final String imageUrl;
  final double rating;
  final String price;
  final String location;
  final List<String> tags;

  Place({
    required this.id,
    required this.category,
    required this.name,
    required this.description,
    required this.fullDescription,
    required this.imageUrl,
    required this.rating,
    required this.price,
    required this.location,
    required this.tags,
  });

  // Données mockées
  static List<Place> getAllPlaces() {
    return [
      Place(
        id: 'a1',
        category: 'nature',
        name: 'Cascades de Karfiguéla',
        description: 'Chutes d\'eau magnifiques près de Banfora.',
        fullDescription: 'Les cascades de Karfiguéla sont l\'un des sites les plus célèbres du Burkina Faso. Nichées au milieu d\'une végétation luxuriante, ces chutes d\'eau offrent un spectacle naturel apaisant. C\'est le lieu idéal pour une baignade rafraîchissante et un pique-nique en famille après avoir exploré les falaises de Banfora.',
        imageUrl: 'https://images.unsplash.com/photo-1609872231367-2dae230b4aff?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&q=80&w=1080',
        rating: 4.9,
        price: '2 000 FCFA',
        location: 'Banfora, Cascades',
        tags: ['Nature', 'Baignade', 'Banfora'],
      ),
      Place(
        id: 'a2',
        category: 'culture',
        name: 'Cour Royale de Tiébélé',
        description: 'Architecture traditionnelle Kasséna aux murs peints.',
        fullDescription: 'Découvrez les chefs-d\'œuvre de l\'architecture Kasséna à Tiébélé. Ces habitations traditionnelles en terre sont magnifiquement décorées de fresques géométriques réalisées à la main par les femmes du village. Un témoignage unique du patrimoine culturel et artistique du sud du pays.',
        imageUrl: 'https://images.unsplash.com/photo-1738255328690-d6ebbbf39234?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&q=80&w=1080',
        rating: 4.8,
        price: '3 000 FCFA',
        location: 'Tiébélé, Centre-Sud',
        tags: ['Culture', 'Architecture', 'UNESCO'],
      ),
      Place(
        id: 'a3',
        category: 'nature',
        name: 'Pics de Sindou',
        description: 'Formations rocheuses millénaires sculptées par le vent.',
        fullDescription: 'Les Pics de Sindou sont une chaîne de formations gréseuses aux formes fantastiques, façonnées par l\'érosion au fil des millénaires. C\'est l\'un des paysages les plus mystiques du Burkina Faso, offrant des points de vue exceptionnels.',
        imageUrl: 'https://images.unsplash.com/photo-1765580454709-e7b92bb5f244?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&q=80&w=1080',
        rating: 4.9,
        price: '2 500 FCFA',
        location: 'Sindou, Cascades',
        tags: ['Randonnée', 'Photographie'],
      ),
      Place(
        id: 'r1',
        category: 'food',
        name: 'Le Gourmet du Faso',
        description: 'Le temple du Poulet Bicyclette et du Riz Gras.',
        fullDescription: 'Situé au cœur de Ouagadougou, ce restaurant emblématique vous propose le meilleur de la cuisine burkinabè. Goûtez à notre spécialité : le poulet bicyclette braisé aux épices locales.',
        imageUrl: 'https://images.unsplash.com/photo-1665332561290-cc6757172890?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&q=80&w=1080',
        rating: 4.6,
        price: '8 000 FCFA',
        location: 'Ouagadougou, Centre',
        tags: ['Cuisine', 'Local', 'Populaire'],
      ),
    ];
  }
}