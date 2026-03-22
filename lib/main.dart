// lib/main.dart

import 'package:flutter/material.dart';
import 'package:faso_tourisme/welcome_page.dart';
import 'package:faso_tourisme/main_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'firebase_options.dart';

const Color d_red = Color(0xFFE9717D);

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Faso Tourisme',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: d_red,
        colorScheme: ColorScheme.fromSeed(seedColor: d_red),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: d_red,
            foregroundColor: Colors.white,
          ),
        ),
      ),
      // FIX : gestion de session — on écoute l'état d'authentification Firebase
      // en temps réel avec StreamBuilder + authStateChanges().
      // Si l'utilisateur est déjà connecté, on va directement sur MainScreen.
      // Sinon, on affiche WelcomePage.
      home: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          // En attente de la réponse Firebase (splash natif géré par Flutter)
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Scaffold(
              body: Center(child: CircularProgressIndicator()),
            );
          }

          // Utilisateur connecté → écran principal
          if (snapshot.hasData && snapshot.data != null) {
            return const MainScreen();
          }

          // Pas de session → page d'accueil
          return const WelcomePage();
        },
      ),
    );
  }
}