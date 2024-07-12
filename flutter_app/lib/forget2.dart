import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart'; // Import nécessaire pour TapGestureRecognizer

class ForgetPasswordPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(
          margin: EdgeInsets.all(8.0), // Espace autour du cercle
          decoration: BoxDecoration(
            color: Colors.grey[300], // Couleur de fond du cercle
            shape: BoxShape.circle,
          ),
          child: IconButton(
            icon: Icon(Icons.arrow_back),
            color: Colors.black, // Couleur de la flèche
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0, // Supprimer l'ombre
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.all(16.0), // Rembourrage général pour la page
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 16), // Espace entre la barre d'applications et le titre
            Text(
              'Check your email',
              style: TextStyle(
                fontSize: 24, // Taille du texte
                color: Colors.black, // Couleur du texte
                fontWeight: FontWeight.bold, // Poids du texte
              ),
            ),
            SizedBox(height: 8), // Espace entre le titre et le sous-titre
            Text(
              'We sent a reset link to your email address. Enter the 5-digit code mentioned in the email:',
              style: TextStyle(
                fontSize: 16, // Taille du texte
                color: Colors.grey, // Couleur du texte
              ),
            ),
            SizedBox(height: 30), // Espace avant les zones de texte

            // Zones de texte pour le code à 5 chiffres
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(
                5,
                (index) => Container(
                  width: 50, // Ajuster la largeur si nécessaire
                  height: 50, // Ajuster la hauteur si nécessaire
                  decoration: BoxDecoration(
                    color: Colors.grey[300], // Couleur de fond de la case
                    borderRadius: BorderRadius.circular(12), // Coins arrondis
                  ),
                  child: TextField(
                    textAlign: TextAlign.center,
                    maxLength: 1, // Permettre seulement 1 caractère par case
                    keyboardType: TextInputType.number,
                    style: TextStyle(fontSize: 18), // Taille du numéro saisi
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      counterText: '', // Cacher le compteur de caractères
                    ),
                  ),
                ),
              ),
            ),

            SizedBox(height: 30), // Espace entre la zone de texte et le bouton
            SizedBox(
              width: double.infinity, // Bouton largeur complète
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF303384), // Couleur de fond
                  padding: EdgeInsets.symmetric(vertical: 15.0), // Rembourrage
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0), // Coins arrondis
                  ),
                ),
                onPressed: () {
                  // Gérer l'action de réinitialisation du mot de passe
                },
                child: Text(
                  'Reset Password',
                  style: TextStyle(
                    color: Colors.white, // Couleur du texte
                    fontSize: 16, // Taille du texte
                  ),
                ),
              ),
            ),

            SizedBox(height: 16), // Espace entre le bouton et le texte supplémentaire
            Center(
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'Haven’t got the email yet? ',
                      style: TextStyle(
                        fontSize: 14, // Taille du texte
                        color: Colors.grey, // Couleur du texte
                      ),
                    ),
                    TextSpan(
                      text: 'Resend email',
                      style: TextStyle(
                        fontSize: 14, // Taille du texte
                        color: Color.fromARGB(255, 9, 12, 150), // Couleur du texte
                        decoration: TextDecoration.underline, // Style souligné
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          // Gérer l'action de renvoi de l'e-mail
                        },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void main() => runApp(MaterialApp(
      home: ForgetPasswordPage(),
    ));
