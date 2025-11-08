import 'package:flutter/material.dart';
import 'login_screen.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            Icon(Icons.person, color: Colors.orange),
            const SizedBox(width: 8),
            const Text(
              'Akun Saya',
              style: TextStyle(
                color: Colors.orange,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Profile Header
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(24),
              color: Colors.white,
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.orange.shade100,
                    child: const Icon(Icons.person, size: 50, color: Colors.orange),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'JEVONZY',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Pelajar',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey.shade600,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            // Menu Items
            Container(
              color: Colors.white,
              child: Column(
                children: [
                  _buildMenuItem(Icons.person_outline, 'Profil Saya', () {}),
                  _buildMenuItem(Icons.emoji_events, 'Prestasi', () {}),
                  _buildMenuItem(Icons.settings, 'Pengaturan', () {}),
                  _buildMenuItem(Icons.help_outline, 'Bantuan', () {}),
                  _buildMenuItem(
                    Icons.logout,
                    'Keluar',
                    () {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: const Text('Keluar'),
                          content: const Text('Apakah kamu yakin ingin keluar?'),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: const Text('Batal'),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const LoginScreen(),
                                  ),
                                  (route) => false,
                                );
                              },
                              child: const Text(
                                'Keluar',
                                style: TextStyle(color: Colors.red),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                    isRed: true,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuItem(IconData icon, String title, VoidCallback onTap,
      {bool isRed = false}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(color: Colors.grey.shade200),
          ),
        ),
        child: Row(
          children: [
            Icon(
              icon,
              color: isRed ? Colors.red : Colors.grey.shade700,
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 16,
                  color: isRed ? Colors.red : Colors.black87,
                ),
              ),
            ),
            Icon(
              Icons.arrow_forward_ios,
              size: 16,
              color: Colors.grey.shade400,
            ),
          ],
        ),
      ),
    );
  }
}