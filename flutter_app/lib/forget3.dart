import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart'; // Import pour TapGestureRecognizer

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
              'Password reset',
              style: TextStyle(
                fontSize: 24, // Taille du texte
                color: Colors.black, // Couleur du texte
                fontWeight: FontWeight.bold, // Poids du texte
              ),
            ),
            SizedBox(height: 8), // Espace entre le titre et le sous-titre
            Text(
              'Your password has been successfully reset. Click Confirm to set a new password.',
              style: TextStyle(
                fontSize: 16, // Taille du texte
                color: Colors.grey, // Couleur du texte
              ),
            ),
            SizedBox(height: 16), // Espace avant le bouton et le texte supplémentaire

            // Bouton "Confirm" pour confirmer le changement de mot de passe
            SizedBox(
              width: double.infinity, // Largeur complète du bouton
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF303384), // Couleur de fond
                  padding: EdgeInsets.symmetric(vertical: 15.0), // Rembourrage
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0), // Coins arrondis
                  ),
                ),
                onPressed: () {
                  // Gérer l'action de confirmation de changement de mot de passe
                },
                child: Text(
                  'Confirm',
                  style: TextStyle(
                    color: Colors.white, // Couleur du texte
                    fontSize: 16, // Taille du texte
                  ),
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
