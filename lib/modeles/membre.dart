class Membre {
  final String id;
  final String nom;
  final String prenom;
  final String mail;
  final String photo;

  Membre({
    required this.id,
    required this.nom,
    required this.prenom,
    required this.mail,
    required this.photo,
  });

  Map<String, dynamic> toMap() {
    return {
      'nom': nom,
      'prenom': prenom,
      'mail': mail,
      'photo': photo,
    };
  }

  static Membre fromMap(String id, Map<String, dynamic> map) {
    return Membre(
      id: id,
      nom: map['nom'],
      prenom: map['prenom'],
      mail: map['mail'],
      photo: map['photo'],
    );
  }
}
