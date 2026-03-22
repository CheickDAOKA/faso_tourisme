import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:faso_tourisme/delayed_animation.dart';

const Color d_red = Color(0xFFE9717D);

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  // FIX : deux états séparés pour les deux champs mot de passe
  bool _isPasswordObscured = true;
  bool _isConfirmPasswordObscured = true;
  bool _isLoading = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  Future<void> _handleSignup() async {
    final email = _emailController.text.trim();
    final password = _passwordController.text.trim();
    final confirm = _confirmPasswordController.text.trim();

    // FIX : validation du format email avant envoi à Firebase
    final emailRegex = RegExp(r'^[\w.-]+@[\w.-]+\.\w{2,}$');
    if (!emailRegex.hasMatch(email)) {
      _showSnackBar("Veuillez entrer une adresse email valide.", Colors.orange);
      return;
    }

    // FIX : vérification longueur minimale mot de passe (exigée par Firebase)
    if (password.length < 6) {
      _showSnackBar(
        "Le mot de passe doit contenir au moins 6 caractères.",
        Colors.orange,
      );
      return;
    }

    if (password != confirm) {
      _showSnackBar(
        "Les mots de passe ne sont pas identiques !",
        Colors.orange,
      );
      return;
    }

    setState(() => _isLoading = true);

    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (mounted) Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      String message;
      switch (e.code) {
        case 'email-already-in-use':
          message = "Cet email est déjà utilisé par un autre compte.";
          break;
        case 'invalid-email':
          message = "L'adresse email n'est pas valide.";
          break;
        case 'weak-password':
          message = "Le mot de passe est trop faible.";
          break;
        default:
          message = "Une erreur est survenue. Veuillez réessayer.";
      }
      if (mounted) _showSnackBar(message, Colors.red);
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  void _showSnackBar(String message, Color color) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message), backgroundColor: color),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DelayedAnimation(
                delay: 500,
                child: Text(
                  "Créer un compte",
                  style: GoogleFonts.poppins(
                    color: d_red,
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              DelayedAnimation(
                delay: 1000,
                child: Text(
                  "Rejoignez l'aventure Faso Tourisme.",
                  style: GoogleFonts.poppins(color: Colors.grey, fontSize: 16),
                ),
              ),
              const SizedBox(height: 40),

              // Champ Email
              _buildEmailField(),
              const SizedBox(height: 20),

              // Champ Mot de passe
              // FIX : chaque champ a son propre état d'obscurcissement
              _buildPasswordField(
                controller: _passwordController,
                label: "Mot de passe",
                delay: 2000,
                isObscured: _isPasswordObscured,
                onToggle: () =>
                    setState(() => _isPasswordObscured = !_isPasswordObscured),
              ),
              const SizedBox(height: 20),

              // Confirmation mot de passe
              _buildPasswordField(
                controller: _confirmPasswordController,
                label: "Confirmer le mot de passe",
                delay: 2500,
                isObscured: _isConfirmPasswordObscured,
                onToggle: () => setState(
                      () => _isConfirmPasswordObscured = !_isConfirmPasswordObscured,
                ),
              ),
              const SizedBox(height: 40),

              // Bouton S'inscrire
              DelayedAnimation(
                delay: 3000,
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
                    onPressed: _isLoading ? null : _handleSignup,
                    child: _isLoading
                        ? const SizedBox(
                      height: 20,
                      width: 20,
                      child: CircularProgressIndicator(
                        color: Colors.white,
                        strokeWidth: 2,
                      ),
                    )
                        : Text(
                      "S'INSCRIRE",
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
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

  Widget _buildEmailField() {
    return DelayedAnimation(
      delay: 1500,
      child: TextField(
        controller: _emailController,
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          labelText: "Email",
          prefixIcon: const Icon(Icons.email_outlined),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        ),
      ),
    );
  }

  // FIX : le widget accepte maintenant son propre état isObscured et onToggle
  Widget _buildPasswordField({
    required TextEditingController controller,
    required String label,
    required int delay,
    required bool isObscured,
    required VoidCallback onToggle,
  }) {
    return DelayedAnimation(
      delay: delay,
      child: TextField(
        controller: controller,
        obscureText: isObscured,
        decoration: InputDecoration(
          labelText: label,
          prefixIcon: const Icon(Icons.lock_outline),
          suffixIcon: IconButton(
            icon: Icon(isObscured ? Icons.visibility : Icons.visibility_off),
            onPressed: onToggle,
          ),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        ),
      ),
    );
  }
}