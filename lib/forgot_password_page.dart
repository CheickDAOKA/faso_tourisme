import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:faso_tourisme/delayed_animation.dart';

const Color d_red = Color(0xFFE9717D);

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final _emailController = TextEditingController();
  bool _isLoading = false;      // FIX : indicateur de chargement
  bool _emailSent = false;      // FIX : état "email envoyé"

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  Future<void> _resetPassword() async {
    final email = _emailController.text.trim();

    if (email.isEmpty) {
      _showMessage("Veuillez entrer votre email", Colors.orange);
      return;
    }

    // Validation basique de l'email
    if (!email.contains('@') || !email.contains('.')) {
      _showMessage("Adresse email invalide", Colors.orange);
      return;
    }

    setState(() => _isLoading = true);

    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);

      // FIX : afficher l'état de succès dans l'UI, pas seulement un SnackBar
      if (mounted) {
        setState(() {
          _isLoading = false;
          _emailSent = true;
        });
      }
    } on FirebaseAuthException catch (e) {
      String message;
      switch (e.code) {
        case 'user-not-found':
        case 'invalid-email':
          message = "Aucun compte trouvé avec cet email.";
          break;
        case 'too-many-requests':
          message = "Trop de tentatives. Réessayez plus tard.";
          break;
        default:
          message = e.message ?? "Une erreur est survenue.";
      }
      if (mounted) {
        setState(() => _isLoading = false);
        _showMessage(message, Colors.red);
      }
    }
  }

  void _showMessage(String message, Color color) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message, style: GoogleFonts.poppins()),
        backgroundColor: color,
        duration: const Duration(seconds: 3),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: _emailSent ? _buildSuccessView() : _buildFormView(),
      ),
    );
  }

  // ── Vue formulaire ────────────────────────────────────────────
  Widget _buildFormView() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 20),

        DelayedAnimation(
          delay: 100,
          child: Text(
            "Récupération",
            style: GoogleFonts.poppins(
              color: d_red,
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(height: 10),

        DelayedAnimation(
          delay: 200,
          child: Text(
            "Entrez votre email pour recevoir un lien de réinitialisation.",
            style: GoogleFonts.poppins(color: Colors.grey, fontSize: 16),
          ),
        ),
        const SizedBox(height: 40),

        // Champ Email
        DelayedAnimation(
          delay: 300,
          child: TextField(
            controller: _emailController,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              labelText: "Votre Email",
              labelStyle: GoogleFonts.poppins(color: Colors.grey),
              prefixIcon: const Icon(Icons.email_outlined, color: d_red),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: d_red),
              ),
            ),
          ),
        ),

        const SizedBox(height: 30),

        // Bouton Envoyer
        DelayedAnimation(
          delay: 400,                         // FIX : délai réduit (était 2000)
          child: SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: d_red,
                padding: const EdgeInsets.symmetric(vertical: 18),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: _isLoading ? null : _resetPassword,
              child: _isLoading
                  ? const SizedBox(
                height: 22,
                width: 22,
                child: CircularProgressIndicator(
                  color: Colors.white,
                  strokeWidth: 2,
                ),
              )
                  : Text(
                "ENVOYER LE LIEN",
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  //  Vue succès (après envoi)
  Widget _buildSuccessView() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Icône succès
          Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: d_red.withValues(alpha:0.1),
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.mark_email_read_outlined,
                color: d_red, size: 60),
          ),
          const SizedBox(height: 24),

          Text(
            "Email envoyé !",
            style: GoogleFonts.poppins(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: d_red,
            ),
          ),
          const SizedBox(height: 12),

          Text(
            "Un lien de réinitialisation a été envoyé à :",
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(color: Colors.grey, fontSize: 14),
          ),
          const SizedBox(height: 6),

          Text(
            _emailController.text.trim(),
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w600,
              fontSize: 15,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 8),

          Text(
            "Vérifiez également vos spams.",
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(color: Colors.grey, fontSize: 13),
          ),
          const SizedBox(height: 40),

          // Retour connexion
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: d_red,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
              ),
              onPressed: () => Navigator.pop(context),
              child: Text(
                "Retour à la connexion",
                style: GoogleFonts.poppins(
                    color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
          ),

          const SizedBox(height: 16),

          // Renvoyer l'email
          TextButton(
            onPressed: () => setState(() {
              _emailSent = false;
              _emailController.clear();
            }),
            child: Text(
              "Renvoyer avec un autre email",
              style: GoogleFonts.poppins(color: Colors.grey),
            ),
          ),
        ],
      ),
    );
  }
}