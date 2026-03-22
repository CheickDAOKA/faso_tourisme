import 'package:flutter/material.dart';
import 'package:faso_tourisme/models/place.dart';
import 'package:faso_tourisme/models/hotel.dart';
import 'package:faso_tourisme/widgets/place_card.dart';
import 'package:faso_tourisme/widgets/hotel_card.dart';
import '../services/favorites_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _searchController = TextEditingController();
  final FavoritesService _favoritesService = FavoritesService();

  List<String> _favorites = [];
  String _searchQuery = '';
  String _selectedCategory = 'all';

  final List<Place> _allPlaces = Place.getAllPlaces();
  final List<Hotel> _allHotels = Hotel.getAllHotels();

  @override
  void initState() {
    super.initState();
    _loadFavorites();
  }

  Future<void> _loadFavorites() async {
    final favorites = await _favoritesService.loadFavorites();
    setState(() {
      _favorites = favorites;
    });
  }

  List<Place> get _filteredPlaces {
    if (_selectedCategory == 'hebergement') return [];
    return _allPlaces.where((place) {
      final matchesCategory = _selectedCategory == 'all' ||
          place.category == _selectedCategory;
      final matchesSearch = place.name
          .toLowerCase()
          .contains(_searchQuery.toLowerCase());
      return matchesCategory && matchesSearch;
    }).toList();
  }

  List<Hotel> get _filteredHotels {
    if (_selectedCategory != 'all' && _selectedCategory != 'hebergement') {
      return [];
    }
    return _allHotels.where((hotel) {
      return hotel.name
          .toLowerCase()
          .contains(_searchQuery.toLowerCase());
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    final showHotels = _selectedCategory == 'all' ||
        _selectedCategory == 'hebergement';

    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            // ✅ FIX : Expanded autour du titre pour éviter l'overflow
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded( // ✅ ajout de Expanded ici
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'BURKINA FASO',
                            style: TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.w800,
                              letterSpacing: 1.5,
                              color: Colors.grey[600],
                            ),
                          ),
                          const SizedBox(height: 4),
                          const Text(
                            'Pays des Hommes Intègres',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w800,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis, // ✅ coupe proprement si besoin
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 12), // ✅ espace entre titre et avatar
                    CircleAvatar(
                      radius: 24,
                      backgroundColor: const Color(0xFFEF2B2D),
                      child: const Text(
                        'BF',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Barre de recherche
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: TextField(
                  controller: _searchController,
                  decoration: InputDecoration(
                    hintText: 'Rechercher une destination...',
                    prefixIcon: const Icon(Icons.search),
                    suffixIcon: IconButton(
                      icon: const Icon(Icons.filter_list),
                      onPressed: () {},
                    ),
                  ),
                  onChanged: (value) {
                    setState(() {
                      _searchQuery = value;
                    });
                  },
                ),
              ),
            ),

            // Filtres par catégorie
            SliverToBoxAdapter(
              child: Container(
                height: 60,
                margin: const EdgeInsets.only(top: 24),
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  children: [
                    _buildCategoryChip('Tout', 'all', Icons.explore),
                    _buildCategoryChip('Nature', 'nature', Icons.camera_alt),
                    _buildCategoryChip('Cuisine', 'food', Icons.restaurant),
                    _buildCategoryChip('Culture', 'culture', Icons.museum),
                    _buildCategoryChip('Hébergement', 'hebergement', Icons.local_hotel),
                  ],
                ),
              ),
            ),

            // Section Destinations
            if (_selectedCategory != 'hebergement') ...[
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(24, 32, 24, 16),
                  child: Text(
                    'Populaire maintenant',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SliverPadding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                sliver: SliverList(
                  delegate: SliverChildBuilderDelegate(
                        (context, index) {
                      final place = _filteredPlaces[index];
                      final wasAlreadyFavorite = _favorites.contains(place.id);
                      return PlaceCard(
                        place: place,
                        isFavorite: wasAlreadyFavorite,
                        onFavoriteToggle: () async {
                          final wasAlreadyFavorite = _favorites.contains(place.id);
                          await _favoritesService.toggleFavorite(place.id);
                          await _loadFavorites();
                          if (!wasAlreadyFavorite && mounted) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Ajouté à vos favoris !'),
                                duration: Duration(seconds: 2),
                              ),
                            );
                          }
                        },
                      );
                    },
                    childCount: _filteredPlaces.length,
                  ),
                ),
              ),
            ],

            // Section Hôtels
            if (showHotels && _filteredHotels.isNotEmpty) ...[
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(24, 32, 24, 16),
                  child: Row(
                    children: [
                      const Icon(Icons.local_hotel,
                          color: Color(0xFFEF2B2D), size: 22),
                      const SizedBox(width: 8),
                      Text(
                        'Hôtels disponibles',
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 2),
                        decoration: BoxDecoration(
                          color: const Color(0xFF009E49),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          '${_filteredHotels.where((h) => h.isAvailable).length} libres',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 11,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SliverPadding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                sliver: SliverList(
                  delegate: SliverChildBuilderDelegate(
                        (context, index) {
                      return HotelCard(hotel: _filteredHotels[index]);
                    },
                    childCount: _filteredHotels.length,
                  ),
                ),
              ),
            ],

            const SliverToBoxAdapter(
              child: SizedBox(height: 100),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryChip(String label, String category, IconData icon) {
    final isSelected = _selectedCategory == category;
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: FilterChip(
        label: Text(label),
        avatar: Icon(icon, size: 18),
        selected: isSelected,
        onSelected: (selected) {
          setState(() {
            _selectedCategory = category;
          });
        },
        selectedColor: const Color(0xFFEF2B2D),
        labelStyle: TextStyle(
          color: isSelected ? Colors.white : Colors.black,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
}