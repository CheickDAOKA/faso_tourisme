import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:faso_tourisme/delayed_animation.dart';
import 'package:faso_tourisme/login_page.dart';

const Color d_red = Color(0xFFE9717D);

class SocialPage extends StatelessWidget {
  const SocialPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final imageHeight = screenHeight * 0.30;

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
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Image Bienvenue
              DelayedAnimation(
                delay: 300,
                child: Image.asset(
                  'images/BIENVENUE.png',
                  height: imageHeight,
                  fit: BoxFit.contain,
                ),
              ),
              const SizedBox(height: 20),

              // Sous-titre
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

              // Bouton Email uniquement
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
            ],
          ),
        ),
      ),
    );
  }
}

// ── Bouton réutilisable ───────────────────────────────────────────
class SocialButton extends StatelessWidget {
  final String text;
  final Color color;
  final Color textColor;
  final IconData? icon;
  final BorderSide? border;
  final VoidCallback onPressed;

  const SocialButton({
    super.key,
    required this.text,
    required this.color,
    required this.onPressed,
    this.textColor = Colors.white,
    this.icon,
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