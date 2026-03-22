import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:faso_tourisme/delayed_animation.dart';
import 'package:faso_tourisme/login_page.dart';

const Color d_red = Color(0xFFE9717D);

class SocialPage extends StatefulWidget {
  const SocialPage({super.key});

  @override
  State<SocialPage> createState() => _SocialPageState();
}

class _SocialPageState extends State<SocialPage> {
  bool _isGoogleLoading = false;

  Future<void> _handleGoogleSignIn() async {
    setState(() => _isGoogleLoading = true);

    try {
      final userCredential = await FirebaseAuth.instance.signInWithProvider(
        GoogleAuthProvider(),
      );
      debugPrint("Connecté : ${userCredential.user?.email}");
    } on FirebaseAuthException catch (e) {
      if (mounted) {
        String message;
        switch (e.code) {
          case 'account-exists-with-different-credential':
            message = "Un compte existe déjà avec cet email.";
            break;
          case 'invalid-credential':
            message = "Identifiants invalides. Réessayez.";
            break;
          case 'popup-closed-by-user':
          case 'canceled':
            message = "Connexion annulée.";
            break;
          default:
            message = "Erreur : ${e.message ?? 'Réessayez.'}";
        }
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(message), backgroundColor: Colors.red),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Connexion Google annulée."),
            backgroundColor: Colors.orange,
          ),
        );
      }
    } finally {
      if (mounted) setState(() => _isGoogleLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    // ✅ Taille de l'écran pour adapter l'image dynamiquement
    final screenHeight = MediaQuery.of(context).size.height;
    final imageHeight = screenHeight * 0.30; // 30% de la hauteur de l'écran

    return Scaffold(
      backgroundColor: const Color(0xFFEDECF2),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black, size: 30),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Center(
        child: SingleChildScrollView( // ✅ évite l'overflow sur petits écrans
          padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // ✅ Image responsive selon la hauteur de l'écran
              DelayedAnimation(
                delay: 300,
                child: Image.asset(
                  'images/BIENVENUE.png',
                  height: imageHeight,
                  fit: BoxFit.contain,
                ),
              ),
              const SizedBox(height: 20),

              DelayedAnimation(
                delay: 500,
                child: Text(
                  "Créez un compte ou connectez-vous pour explorer le pays des Hommes Intègres.",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                    color: Colors.grey[700],
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const SizedBox(height: 50),

              // Bouton Email
              DelayedAnimation(
                delay: 700,
                child: SocialButton(
                  text: 'Continuer avec Email',
                  icon: Icons.mail_outline,
                  color: d_red,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginPage()),
                    );
                  },
                ),
              ),
              const SizedBox(height: 20),

              // Bouton Facebook désactivé
              DelayedAnimation(
                delay: 900,
                child: Opacity(
                  opacity: 0.5,
                  child: SocialButton(
                    text: 'Continuer avec Facebook',
                    faIcon: FontAwesomeIcons.facebook,
                    color: const Color(0xFF1877F2),
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Connexion Facebook bientôt disponible."),
                          backgroundColor: Colors.grey,
                          duration: Duration(seconds: 2),
                        ),
                      );
                    },
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Bouton Google
              DelayedAnimation(
                delay: 1100,
                child: _isGoogleLoading
                    ? const SizedBox(
                  height: 54,
                  child: Center(child: CircularProgressIndicator()),
                )
                    : SocialButton(
                  text: 'Continuer avec Google',
                  image: 'images/google.png',
                  color: Colors.white,
                  textColor: Colors.black,
                  border: BorderSide(color: Colors.grey.shade300),
                  onPressed: _handleGoogleSignIn,
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}

class SocialButton extends StatelessWidget {
  final String text;
  final Color color;
  final Color textColor;
  final IconData? icon;
  final IconData? faIcon;
  final String? image;
  final BorderSide? border;
  final VoidCallback onPressed;

  const SocialButton({
    super.key,
    required this.text,
    required this.color,
    required this.onPressed,
    this.textColor = Colors.white,
    this.icon,
    this.faIcon,
    this.image,
    this.border,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          side: border,
          shape: const StadiumBorder(),
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        ),
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (icon != null) Icon(icon, color: textColor),
            if (faIcon != null) FaIcon(faIcon, color: textColor),
            if (image != null) Image.asset(image!, height: 22),
            const SizedBox(width: 12),
            Text(
              text,
              style: GoogleFonts.poppins(
                color: textColor,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}