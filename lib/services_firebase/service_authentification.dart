import 'package:chti_face_bouc/services_firebase/service_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ServiceAuthentification {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  /// Connexion d'un utilisateur
  Future<String> signIn({
    required String email,
    required String password,
  }) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      return "success";
    } on FirebaseAuthException catch (e) {
      return e.code; // ex : 'user-not-found', 'wrong-password'
    }
  }

  /// Création d'un compte utilisateur + ajout dans Firestore
  Future createAccount({
    required String email,
    required String password,
    required String surname,
    required String name,
  }) async {
    try {
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);

      await ServiceFirestore().addMember(
        id: userCredential.user!.uid,
        data: {'email': email, 'surname': surname, 'name': name},
      );
    } catch (e) {
      throw Exception('Failed to sign up: $e');
    }
  }

  /// Déconnexion de l'utilisateur
  Future<void> signOut() async => await _auth.signOut();

  /// Vérifie si un utilisateur est connecté
  bool get isLoggedIn => _auth.currentUser != null;

  /// Récupère l'ID de l'utilisateur connecté
  String? get myId => _auth.currentUser?.uid;

  /// Vérifie si un ID correspond à l'utilisateur connecté
  bool isMe(String userId) => _auth.currentUser?.uid == userId;
}
