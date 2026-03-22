import 'package:flutter/material.dart';
import 'package:faso_tourisme/models/place.dart';
import 'package:faso_tourisme/widgets/place_card.dart';
import 'package:faso_tourisme/services/favorites_service.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({super.key});

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  final FavoritesService _favoritesService = FavoritesService();
  List<String> _favorites = [];

  // FIX : favoritePlaces est calculé dans le state, pas dans build(),
  // pour qu'il se mette à jour correctement après setState.
  List<Place> _favoritePlaces = [];

  @override
  void initState() {
    super.initState();
    _loadFavorites();
  }

  Future<void> _loadFavorites() async {
    final favorites = await _favoritesService.loadFavorites();
    setState(() {
      _favorites = favorites;
      // FIX : recalcul de la liste des lieux favoris dans setState
      _favoritePlaces = Place.getAllPlaces()
          .where((place) => _favorites.contains(place.id))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      appBar: AppBar(
        title: const Text(
          'Mes Favoris',
          style: TextStyle(fontWeight: FontWeight.w900),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: _favoritePlaces.isEmpty
          ? Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.favorite_outline,
              size: 80,
              color: Colors.grey[300],
            ),
            const SizedBox(height: 16),
            Text(
              'Aucun favori pour le moment',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                color: Colors.grey[600],
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Explorez le pays et cliquez sur le cœur !',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Colors.grey[500],
              ),
            ),
          ],
        ),
      )
          : ListView.builder(
        padding: const EdgeInsets.all(24),
        itemCount: _favoritePlaces.length,
        itemBuilder: (context, index) {
          final place = _favoritePlaces[index];
          return PlaceCard(
            place: place,
            isFavorite: true,
            onFavoriteToggle: () async {
              await _favoritesService.toggleFavorite(place.id);
              // FIX : rechargement après suppression pour mise à jour immédiate
              await _loadFavorites();
            },
          );
        },
      ),
    );
  }
}