# faso_tourisme
# 🇧🇫 Faso Tourisme🌍

**Faso Tourisme** est une application mobile moderne développée avec **Flutter**. Elle a pour mission de promouvoir le tourisme au Burkina Faso en permettant aux utilisateurs de découvrir des sites magnifiques, de trouver des hôtels de qualité et d'explorer la culture locale.

---

## ✨ Fonctionnalités

- 📍 **Découverte des Sites** : Explorez les cascades de Karfiguéla, les pics de Sindou, les ruines de Loropéni, etc.
- 🏨 **Gestion des Hôtels** : Visualisez les meilleurs hôtels, leurs tarifs par nuit, leur disponibilité et leurs notes.
- 🎨 **Interface Moderne** : Design épuré avec des composants réutilisables (Cards, Badges, Thèmes personnalisés).
- 🖼️ **Images avec Cache** : Utilisation de `cached_network_image` pour une expérience fluide et une économie de données.
- 🌗 **Support du Mode Sombre** : Thème complet adapté à vos préférences visuelles.

---

## 📸 Captures d'écran

|                             Accueil                              |                           Détails Hôtel                           |                              Recherche                               |
|:----------------------------------------------------------------:|:-----------------------------------------------------------------:|:--------------------------------------------------------------------:|
| ![Home Screen](https://via.placeholder.com/200x400?text=Accueil) | ![Hotel Screen](https://via.placeholder.com/200x400?text=Détails) | ![Search Screen](https://via.placeholder.com/200x400?text=Recherche) |

---

## 🛠️ Technologies Utilisées

- **Framework** : [Flutter](https://flutter.dev) (Dart)
- **Gestion d'images** : `cached_network_image`
- **Design** : Material Design 3
- **Icônes** : Material Icons & FontAwesome

---

## 🚀 Installation et Lancement
Pour tester l'application Faso Tourisme sur votre propre machine, suivez ces étapes détaillées :1. PrérequisAvant de commencer, assurez-vous d'avoir installé :
Avant de commencer, assurez-vous d'avoir installé :
.Flutter SDK (Version 3.19 ou plus récente)
 •Dart SDK•
Un simulateur (iOS/Android) ou un appareil physique connecté.

1. Cloner le projetRécupérez une copie locale du code source en utilisant Git :
    git clone https://github.com/CheickDAOKA/faso_tourisme.git
   cd faso_tourisme

2. Installer les dépendances
Cette commande télécharge toutes les bibliothèques nécessaires (comme cached_network_image, google_fonts, etc.) listées dans le fichier pubspec.yaml :
Suivez ces étapes pour tester le projet sur votre machine :
   flutter pub get
3. Configurer les ressources (Assets)
L'application utilise des images locales. Vérifiez que le dossier assets/images/ contient bien les fichiers nécessaires. Si vous utilisez Firebase par la suite, n'oubliez pas d'ajouter votre fichier google-services.json.

4. Lancer l'applicationCompilez et lancez le projet sur votre émulateur ou votre téléphone :
   flutter run

📂 Structure du Projet:
lib/
├── models/          # Classes de données (Hotel, Place, User, etc.)
├── screens/         # Les pages complètes de l'application
│   ├── auth/        # Connexion, Inscription, Oubli de mot de passe
│   ├── home/        # Page d'accueil et tableaux de bord
│   └── details/     # Pages de détails pour les sites et hôtels
├── services/        # Logique métier et appels aux données (Mock/API)
├── theme/           # Configuration globale des couleurs et styles (AppTheme)
├── utils/           # Fonctions d'aide, constantes et validateurs
├── widgets/         # Composants UI réutilisables (Cards, Buttons, Inputs)
└── main.dart        # Point d'entrée de l'application
-
⭐ N'hésitez pas à mettre une étoile au projet si vous l'aimez !


---

## 🤝 Contribution

Les contributions sont les bienvenues !
1. Forkez le projet.
2. Créez votre branche : `git checkout -b feature/AmazingFeature`.
3. Commitez vos changements : `git commit -m 'Add some AmazingFeature'`.
4. Pushez vers la branche : `git push origin feature/AmazingFeature`.
5. Ouvrez une **Pull Request**.

---

## 👤 Auteur

**Cheick DAOKA**
- GitHub : [@CheickDAOKA](https://github.com/CheickDAOKA)
- LinkedIn : [Cheick DAO](https://www.linkedin.com/in/cheick-dao-29b588371)

---

⭐ N'hésitez pas à mettre une étoile au projet si vous l'aimez !
