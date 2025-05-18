import 'package:flutter/material.dart';
import '../services_firebase/service_authentification.dart';
import 'page_navigation.dart';

class PageAuthentification extends StatefulWidget {
  const PageAuthentification({super.key});

  @override
  State<PageAuthentification> createState() => _PageAuthentificationState();
}

class _PageAuthentificationState extends State<PageAuthentification> {
  bool accountExists = true;

  final TextEditingController mailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController surnameController = TextEditingController();
  final TextEditingController nameController = TextEditingController();

  @override
  void dispose() {
    mailController.dispose();
    passwordController.dispose();
    surnameController.dispose();
    nameController.dispose();
    super.dispose();
  }

  void _handleAuth() async {
    final email = mailController.text.trim();
    final password = passwordController.text.trim();
    final prenom = surnameController.text.trim();
    final nom = nameController.text.trim();

    final auth = ServiceAuthentification();
    String result;

    if (accountExists) {
      result = await auth.signIn(email: email, password: password);
    } else {
      result = await auth.createAccount(
        email: email,
        password: password,
        surname: prenom,
        name: nom,
      );
    }

    if (result == "success") {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const PageNavigation()),
      );
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Erreur : $result")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple[50],
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              const SizedBox(height: 20),
              Image.network(
                'https://images.ctfassets.net/hrltx12pl8hq/28ECAQiPJZ78hxatLTa7Ts/2f695d869736ae3b0de3e56ceaca3958/free-nature-images.jpg?fit=fill&w=1200&h=630',
                height: 200,
              ),
              const SizedBox(height: 20),

              // Toggle boutons
              ToggleButtons(
                borderRadius: BorderRadius.circular(30),
                isSelected: [!accountExists, accountExists],
                onPressed: (index) {
                  setState(() {
                    accountExists = index == 1;
                  });
                },
                children: const [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    child: Text("Créer un compte"),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    child: Text("✓ y va connecter"),
                  ),
                ],
              ),
              const SizedBox(height: 24),

              // Champs
              TextField(
                controller: mailController,
                decoration: const InputDecoration(labelText: "Adresse mail"),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: passwordController,
                obscureText: true,
                decoration: const InputDecoration(labelText: "Mot de passe"),
              ),
              const SizedBox(height: 12),

              if (!accountExists) ...[
                TextField(
                  controller: surnameController,
                  decoration: const InputDecoration(labelText: "Prénom"),
                ),
                const SizedBox(height: 12),
                TextField(
                  controller: nameController,
                  decoration: const InputDecoration(labelText: "Nom"),
                ),
                const SizedBox(height: 12),
              ],

              const SizedBox(height: 20),

              // Bouton
              ElevatedButton(
                onPressed: _handleAuth,
                child: const Text("C’est parti !"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
