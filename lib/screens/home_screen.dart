import 'package:flutter/material.dart';
import 'category_materi_screen.dart';
import 'widgets/illustration_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

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
                  child: const Icon(Icons.person, color: Colors.orange, size: 20),
                ),
              ],
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Pilih Kategori Belajar',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 16),
            // Category Cards
            _buildCategoryCard(
              context,
              'Matematika',
              'Belajar berhitung dengan mudah',
              Colors.blue,
              Icons.calculate,
              'matematika',
            ),
            const SizedBox(height: 16),
            _buildCategoryCard(
              context,
              'Literasi',
              'Belajar membaca dan menulis',
              Colors.green,
              Icons.book,
              'literasi',
            ),
            const SizedBox(height: 16),
            _buildCategoryCard(
              context,
              'Sains',
              'Belajar tentang alam sekitar',
              Colors.purple,
              Icons.science,
              'sains',
            ),
            const SizedBox(height: 24),
            // Illustration Images
            const Text(
              'Ilustrasi Pembelajaran',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 16),
            GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              mainAxisSpacing: 16,
              crossAxisSpacing: 16,
              childAspectRatio: 1.5,
              children: [
                IllustrationCard(color: Colors.orange.shade100, icon: Icons.pets),
                IllustrationCard(color: Colors.pink.shade100, icon: Icons.cake),
                IllustrationCard(color: Colors.green.shade100, icon: Icons.book),
                IllustrationCard(color: Colors.blue.shade100, icon: Icons.science),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryCard(
    BuildContext context,
    String title,
    String subtitle,
    Color color,
    IconData icon,
    String category,
  ) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CategoryMateriListScreen(
              category: category,
              categoryTitle: title,
              categoryColor: color,
            ),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: color.withOpacity(0.3),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.3),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(icon, color: Colors.white, size: 32),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    subtitle,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
            const Icon(Icons.arrow_forward_ios, color: Colors.white, size: 20),
          ],
        ),
      ),
    );
  }
}
