import 'package:flutter/material.dart';
import 'package:flutter_app/course_content.dart'; // Assurez-vous que ce fichier contient la classe CourseContent
import 'package:flutter_app/models/courses_model.dart';
import 'package:get/get.dart';

// Le widget Detailcourse affiche des informations détaillées sur un cours spécifique
class Detailcourse extends StatelessWidget {
  final Course course;  // Le modèle de cours passé en paramètre au widget

  const Detailcourse({Key? key, required this.course, required courses_model}) : super(key: key);  // Constructeur prenant un modèle de cours en paramètre

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        // Gère l'événement de navigation arrière
        Navigator.of(context).pop(true);  // Revenir à la page précédente
        return true;  // Permet l'action de retour
      },
      child: Scaffold(
        backgroundColor: const Color(0xFF303384),  // Couleur de fond de l'écran
        appBar: AppBar(
          title: const Text(
            'Details course',  // Titre de l'AppBar
            style: TextStyle(
              color: Colors.white,  // Couleur du texte du titre
              fontFamily: 'Ubuntu',  // Famille de police du titre
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
          backgroundColor: const Color(0xFF303384),  // Couleur de fond de l'AppBar
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),  // Icône de retour
            onPressed: () {
              // Action lorsque le bouton de retour est pressé
              Navigator.of(context).pop();  // Revenir à la page précédente
            },
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.account_circle),  // Icône de profil utilisateur
              color: Colors.white,
              onPressed: () {
                // Action pour l'icône de profil (aucune fonctionnalité pour l'instant)
              },
            ),
          ],
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,  // Espacer le titre et l'évaluation
                children: [
                  Text(
                    course.name,  // Nom du cours
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Ubuntu',
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.star,  // Icône pour l'évaluation
                        color: Colors.yellow,
                        size: 24.0,
                      ),
                      const SizedBox(width: 4),  // Espacement entre l'icône et le texte
                      Text(
                        course.rating.toString(),  // Évaluation du cours
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Ubuntu',
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),  // Espacement entre l'en-tête et le contenu
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,  // Couleur de fond du conteneur de contenu
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16.0),  // Coins arrondis en haut à gauche
                    topRight: Radius.circular(16.0),  // Coins arrondis en haut à droite
                  ),
                ),
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,  // Aligner le contenu au début de la colonne
                  children: [
                    Container(
                      alignment: Alignment.center,  // Centrer la ligne
                      child: Container(
                        width: 80,  // Largeur de la ligne
                        height: 4,  // Hauteur de la ligne
                        decoration: BoxDecoration(
                          color: Colors.blue,  // Couleur de la ligne
                          borderRadius: BorderRadius.circular(2),  // Coins arrondis pour la ligne
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),  // Espacement entre la ligne et l'image du cours
                    Center(
                      child: Container(
                        width: 400,  // Largeur de l'image du cours
                        height: 250,  // Hauteur de l'image du cours
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),  // Coins arrondis pour le conteneur de l'image
                          image: DecorationImage(
                            image: AssetImage(course.imagePath),  // Image du cours
                            fit: BoxFit.cover,  // Couvrir le conteneur
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),  // Espacement entre l'image et le texte de résumé
                    const Text(
                      'Summary of the course:',  // En-tête de la section de résumé
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Ubuntu',
                      ),
                    ),
                    const SizedBox(height: 10),  // Espacement entre le texte de résumé et les détails
                    Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Color(0xFF333333),  // Couleur de fond de l'icône
                            shape: BoxShape.circle,  // Fond circulaire pour l'icône
                          ),
                          padding: const EdgeInsets.all(8),
                          child: const Icon(
                            Icons.menu_book,  // Icône pour les chapitres
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(width: 10),  // Espacement entre l'icône et le texte
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,  // Aligner le texte au début
                          children: [
                            Text(
                              '${course.chapters.length} chapters',  // Nombre de chapitres du cours
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Ubuntu',
                              ),
                            ),
                            const SizedBox(height: 5),  // Espacement entre le texte des chapitres et la description
                            Text(
                              'Complete the coursework then attempt the quiz.',  // Exigence de réussite du cours
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey,
                                fontFamily: 'Ubuntu',
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),  // Espacement entre les détails
                    Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Color(0xFF333333),  // Couleur de fond de l'icône
                            shape: BoxShape.circle,  // Fond circulaire pour l'icône
                          ),
                          padding: const EdgeInsets.all(8),
                          child: const Icon(
                            Icons.access_time,  // Icône pour la durée du cours
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(width: 10),  // Espacement entre l'icône et le texte
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,  // Aligner le texte au début
                          children: [
                            Text(
                              '${course.duration} hours',  // Durée du cours
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Ubuntu',
                              ),
                            ),
                            const SizedBox(height: 5),  // Espacement entre le texte de la durée et la description
                            const Text(
                              'Total duration of the course',  // Description de la durée du cours
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey,
                                fontFamily: 'Ubuntu',
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),  // Espacement entre les détails
                    Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Color(0xFF333333),  // Couleur de fond de l'icône
                            shape: BoxShape.circle,  // Fond circulaire pour l'icône
                          ),
                          padding: const EdgeInsets.all(8),
                          child: const Icon(
                            Icons.star,  // Icône pour les récompenses
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(width: 10),  // Espacement entre l'icône et le texte
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,  // Aligner le texte au début
                          children: [
                            const Text(
                              'Win 10 star',  // Récompense pour le cours
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Ubuntu',
                              ),
                            ),
                            const SizedBox(height: 5),  // Espacement entre le texte de la récompense et la description
                            const Text(
                              'Answer all questions of the quiz correctly',  // Description de la récompense
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey,
                                fontFamily: 'Ubuntu',
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),  // Espacement avant le bouton d'inscription
                    Center(
                      child: ElevatedButton(
                        onPressed: () => Get.to(() => CourseContent(course: course)),  // Naviguer vers la page CourseContent
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFF9B32D),  // Couleur de fond du bouton
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(horizontal: 54, vertical: 20),
                          textStyle: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        child: const Text('Enroll'),  // Texte du bouton
                      ),
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
