import 'package:flutter/material.dart';
import 'package:flutter_auth1/pages/masuk.dart';
import 'package:flutter_auth1/services/firebase_auth.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user =
        AuthenticationHelper().user; // Mendapatkan data pengguna saat ini

    return Scaffold(
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // CircleAvatar(
              //   backgroundImage: NetworkImage(imageUrl),
              //   radius: 60,
              //   backgroundColor: Colors.transparent,
              // ),
              const SizedBox(
                height: 30,
              ),
              const Text(
                'Welcome',
                style: TextStyle(fontSize: 24),
              ),
              const SizedBox(height: 20),
              Text(
                'Name: ${user?.displayName ?? "N/A"}', // Menampilkan nama pengguna jika tersedia
                style: const TextStyle(fontSize: 18),
              ),
              Text(
                'Email: ${user?.email ?? "N/A"}', // Menampilkan email pengguna jika tersedia
                style: const TextStyle(fontSize: 18),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          AuthenticationHelper()
              .signOut()
              .then((_) => Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => Login()),
                  ));
        },
        child: const Icon(Icons.logout),
        tooltip: 'Logout',
      ),
    );
  }
}
