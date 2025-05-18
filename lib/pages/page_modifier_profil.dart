import 'package:flutter/material.dart';
import '../modeles/membre.dart';

/// Page permettant de modifier le profil d'un membre.
class PageModifierProfil extends StatefulWidget {
  final Membre membre;

  const PageModifierProfil({Key? key, required this.membre}) : super(key: key);

  @override
  _PageModifierProfilState createState() => _PageModifierProfilState();
}

class _PageModifierProfilState extends State<PageModifierProfil> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _nomController;
  late TextEditingController _bioController;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _nomController = TextEditingController(text: widget.membre.name);
    _bioController = TextEditingController(text: widget.membre.description);
  }

  @override
  void dispose() {
    _nomController.dispose();
    _bioController.dispose();
    super.dispose();
  }

  Future<void> _saveProfile() async {
    if (!_formKey.currentState!.validate()) return;
    setState(() => _isLoading = true);

    // final updatedMembre = widget.membre.copyWith(
    //   nom: _nomController.text.trim(),
    //   bio: _bioController.text.trim(),
    // );

    // try {
    //   await ServiceFirestore().updateMembre(updatedMembre);
    //   Navigator.pop(context, updatedMembre);
    // } catch (e) {
    //   ScaffoldMessenger.of(context)
    //       .showSnackBar(SnackBar(content: Text('Erreur: \$e')));
    // } finally {
    //   if (mounted) setState(() => _isLoading = false);
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Modifier le profil'),
        actions: [
          IconButton(
            icon: const Icon(Icons.save),
            onPressed: _isLoading ? null : _saveProfile,
          ),
        ],
      ),
      body:
          _isLoading
              ? const Center(child: CircularProgressIndicator())
              : Padding(
                padding: const EdgeInsets.all(16.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: _nomController,
                        decoration: const InputDecoration(
                          labelText: 'Nom',
                          border: OutlineInputBorder(),
                        ),
                        validator:
                            (value) =>
                                value == null || value.isEmpty
                                    ? 'Entrez un nom'
                                    : null,
                      ),
                      const SizedBox(height: 16),
                      TextFormField(
                        controller: _bioController,
                        decoration: const InputDecoration(
                          labelText: 'Bio',
                          border: OutlineInputBorder(),
                        ),
                        maxLines: 3,
                      ),
                    ],
                  ),
                ),
              ),
    );
  }
}
