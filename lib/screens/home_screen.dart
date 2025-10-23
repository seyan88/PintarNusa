import 'package:flutter/material.dart';
import 'materi_detail_screen.dart';
import 'widgets/material_card.dart';
import 'widgets/illustration_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Row(
          children: [
            Icon(Icons.school, color: Colors.orange),
            const SizedBox(width: 8),
            const Text(
              'PinterNusa',
              style: TextStyle(
                color: Colors.orange,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Row(
              children: [
                const Text(
                  'JEVONZY',
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(width: 8),
                CircleAvatar(
                  radius: 18,
                  backgroundColor: Colors.orange.shade100,
                  child: const Icon(
                    Icons.person,
                    color: Colors.orange,
                    size: 20,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            // Materi 1 Card
            MaterialCard(
              title: 'Materi ke 1',
              subtitle: 'Belajar di saat menyenangkan',
              color: Colors.green,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        const MateriDetailScreen(materiNumber: 1),
                  ),
                );
              },
            ),
            const SizedBox(height: 16),
            // Materi 2 Card
            MaterialCard(
              title: 'Materi ke 2',
              subtitle: 'Belajar dengan mudah',
              color: Colors.orange,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        const MateriDetailScreen(materiNumber: 2),
                  ),
                );
              },
            ),
            const SizedBox(height: 24),
            // Illustration Images
            GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              mainAxisSpacing: 16,
              crossAxisSpacing: 16,
              childAspectRatio: 1.5,
              children: [
                IllustrationCard(
                  color: Colors.orange.shade100,
                  icon: Icons.pets,
                ),
                IllustrationCard(color: Colors.pink.shade100, icon: Icons.cake),
                IllustrationCard(
                  color: Colors.green.shade100,
                  icon: Icons.book,
                ),
                IllustrationCard(
                  color: Colors.blue.shade100,
                  icon: Icons.science,
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.orange,
        unselectedItemColor: Colors.grey,
        currentIndex: 0,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Beranda'),
          BottomNavigationBarItem(icon: Icon(Icons.book), label: 'Materi'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Akun'),
        ],
      ),
    );
  }
}
