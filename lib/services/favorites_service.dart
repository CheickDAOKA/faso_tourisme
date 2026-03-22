import 'package:shared_preferences/shared_preferences.dart';

class FavoritesService {
  static const String _key = 'bf_favorites';

  // Charger les favoris
  Future<List<String>> loadFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getStringList(_key) ?? [];
  }

  // Sauvegarder les favoris
  Future<void> saveFavorites(List<String> favorites) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList(_key, favorites);
  }

  // Basculer un favori
  Future<bool> toggleFavorite(String placeId) async {
    final favorites = await loadFavorites();
    final isFavorite = favorites.contains(placeId);

    if (isFavorite) {
      favorites.remove(placeId);
    } else {
      favorites.add(placeId);
    }

    await saveFavorites(favorites);
    return !isFavorite; // Retourne le nouvel état
  }

  // Vérifier si un lieu est favori
  Future<bool> isFavorite(String placeId) async {
    final favorites = await loadFavorites();
    return favorites.contains(placeId);
  }
}// TODO Implement this library.