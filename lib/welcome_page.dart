import 'package:faso_tourisme/social_page.dart';
import 'package:flutter/material.dart';
import 'package:faso_tourisme/delayed_animation.dart';
import 'package:google_fonts/google_fonts.dart';

// FIX : suppression de l'import circulaire de main.dart
// d_red est défini localement ici
const Color d_red = Color(0xFFE9717D);

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // 1. Image de fond
          Image.asset(
            'images/monument.jpg',
            fit: BoxFit.cover,
          ),

          // 2. Dégradé pour la lisibilité du texte
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.transparent, Colors.black.withValues(alpha: 0.8)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: const [0.5, 1.0],
              ),
            ),
          ),

          // 3. Contenu textuel et bouton
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 40),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [

                  // --- PARTIE BASSE : TEXTES ET BOUTON ---
                  Column(
                    children: [
                      // FIX : délai réduit de 2500ms → 500ms
                      DelayedAnimation(
                        delay: 500,
                        child: Text(
                          "Explorez le Burkina Faso",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      // FIX : délai réduit de 3500ms → 800ms
                      DelayedAnimation(
                        delay: 800,
                        child: Text(
                          "La destination authentique à ne pas manquer.",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.poppins(
                            color: Colors.white.withValues(alpha: 0.8),
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      const SizedBox(height: 40),
                      // FIX : délai réduit de 4500ms → 1100ms
                      DelayedAnimation(
                        delay: 1100,
                        child: SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: d_red,
                              shape: const StadiumBorder(),
                              padding:
                              const EdgeInsets.symmetric(vertical: 15),
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const SocialPage(),
                                ),
                              );
                            },
                            child: Text(
                              "C'EST PARTI !",
                              style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}