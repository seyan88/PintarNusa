import 'package:flutter/material.dart';
import 'leaderboard_screen.dart';
import 'widgets/answer_button.dart';

class MateriDetailScreen extends StatelessWidget {
  final int materiNumber;

  const MateriDetailScreen({super.key, required this.materiNumber});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
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
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Video Player Container
            Container(
              width: double.infinity,
              height: 250,
              color: Colors.grey.shade300,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  const Icon(
                    Icons.play_circle_outline,
                    size: 80,
                    color: Colors.white,
                  ),
                  Positioned(
                    top: 16,
                    right: 16,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.orange,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Text(
                        'SKIP',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // Description Section
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Video Description',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'Ini adalah video yang dibuat khusus bagi kidsdan. Berbentuk video yang ngga tingkat kesulitannya dan mudah untuk dipahami, membuat pemirsa sangat panjang peningkatan, memberi marka masalah serta terkaya.',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey.shade700,
                      height: 1.5,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'Yaps dari dengan cocok dari nahu ada metode baru, cara cara yang baru untuk mengikuti kelas kelas serta dengan mudah gampang mengikuti remilia.',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey.shade700,
                      height: 1.5,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            // Answer Buttons
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  AnswerButton(
                    text: 'Jawaban 1',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LeaderboardScreen(),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 12),
                  AnswerButton(text: 'Jawaban 2', onPressed: () {}),
                  const SizedBox(height: 12),
                  AnswerButton(text: 'Jawaban 3', onPressed: () {}),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          children: [
            Expanded(
              child: ElevatedButton(
                onPressed: () => Navigator.pop(context),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  'Kontak',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  'Selanjutnya',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
