import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Méthode pour obtenir l'utilisateur courant
  User? get currentUser => _auth.currentUser;

  // Méthode pour récupérer le nom d'utilisateur
  Future<String> fetchUsername() async {
    try {
      final user = currentUser;
      if (user != null) {
        DocumentSnapshot userDoc = await FirebaseFirestore.instance
            .collection('users')
            .doc(user.uid)
            .get();
        return userDoc['username'] ?? 'User';
      } else {
        return 'User';
      }
    } catch (e) {
      print("Error fetching username: $e");
      return 'Error fetching username';
    }
  }
}
