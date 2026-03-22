import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

// ✅ FIX : StatefulWidget pour que context.mounted fonctionne correctement
class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  // ✅ FIX : _logout utilise maintenant le context du State, plus fiable
  Future<void> _logout() async {
    Navigator.pop(context); // ferme le bottom sheet
    await FirebaseAuth.instance.signOut();
    // Le StreamBuilder dans main.dart détecte automatiquement
    // la déconnexion et redirige vers WelcomePage — pas besoin de Navigator
  }

  void _showLogoutDialog() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (_) => Container(
        padding: const EdgeInsets.all(24),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 56,
              height: 56,
              decoration: const BoxDecoration(
                color: Color(0xFFFDECEA),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.logout,
                color: Color(0xFFEF2B2D),
                size: 24,
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Se déconnecter ?',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              'Vous devrez vous reconnecter pour accéder à votre compte Faso Tourisme.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 13, color: Colors.grey),
            ),
            const SizedBox(height: 28),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () => Navigator.pop(context),
                    style: OutlinedButton.styleFrom(
                      minimumSize: const Size(double.infinity, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text('Annuler'),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton(
                    onPressed: _logout,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFEF2B2D),
                      foregroundColor: Colors.white,
                      minimumSize: const Size(double.infinity, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text(
                      'Déconnecter',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final User? user = FirebaseAuth.instance.currentUser;
    final String displayName = user?.displayName ?? 'Voyageur Intègre';
    final String email = user?.email ?? 'Passionné du Faso';
    final String avatarLetter =
    displayName.isNotEmpty ? displayName[0].toUpperCase() : 'V';

    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 40),

              // Avatar
              Stack(
                children: [
                  user?.photoURL != null
                      ? CircleAvatar(
                    radius: 50,
                    backgroundImage: NetworkImage(user!.photoURL!),
                    onBackgroundImageError: (_, __) {},
                  )
                      : CircleAvatar(
                    radius: 50,
                    backgroundColor: const Color(0xFFEF2B2D),
                    child: Text(
                      avatarLetter,
                      style: const TextStyle(
                        fontSize: 40,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      padding: const EdgeInsets.all(4),
                      decoration: const BoxDecoration(
                        color: Color(0xFFEF2B2D),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.camera_alt,
                        size: 16,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),

              Text(
                displayName,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                email,
                style: const TextStyle(color: Colors.grey),
              ),
              const SizedBox(height: 40),

              // Menu items
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 24),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Column(
                  children: [
                    _buildMenuItem(
                      icon: Icons.person,
                      title: 'Informations personnelles',
                      subtitle: 'Modifier votre profil',
                      color: Colors.red[300]!,
                    ),
                    const Divider(height: 1, indent: 72),
                    _buildMenuItem(
                      icon: Icons.history,
                      title: 'Historique des visites',
                      subtitle: 'Vos lieux explorés',
                      color: Colors.green[700]!,
                    ),
                    const Divider(height: 1, indent: 72),
                    _buildMenuItem(
                      icon: Icons.notifications,
                      title: 'Notifications',
                      subtitle: 'Alertes et événements',
                      color: Colors.amber[700]!,
                    ),
                    const Divider(height: 1, indent: 72),
                    _buildMenuItem(
                      icon: Icons.help_outline,
                      title: 'Aide & Support',
                      subtitle: 'Besoin d\'un guide ?',
                      color: Colors.blue[400]!,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),

              // Bouton déconnexion
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: FilledButton.tonal(
                  onPressed: _showLogoutDialog,
                  style: FilledButton.styleFrom(
                    minimumSize: const Size(double.infinity, 56),
                    backgroundColor:
                    const Color(0xFFEF2B2D).withOpacity(0.05),
                    foregroundColor: const Color(0xFFEF2B2D),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.logout),
                      SizedBox(width: 8),
                      Text(
                        'Déconnexion',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMenuItem({
    required IconData icon,
    required String title,
    required String subtitle,
    required Color color,
  }) {
    return ListTile(
      contentPadding:
      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      leading: CircleAvatar(
        backgroundColor: color.withOpacity(0.2),
        child: Icon(icon, color: color),
      ),
      title: Text(
        title,
        style: const TextStyle(fontWeight: FontWeight.w600),
      ),
      subtitle: Text(subtitle),
      trailing:
      const Icon(Icons.keyboard_arrow_right, color: Colors.grey),
      onTap: () {},
    );
  }
}