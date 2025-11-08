import 'package:flutter/material.dart';
import 'main_navigation.dart';

class QuizResultScreen extends StatelessWidget {
  final int totalQuestions;
  final int correctAnswers;
  final String category;
  final Color categoryColor;

  const QuizResultScreen({
    Key? key,
    required this.totalQuestions,
    required this.correctAnswers,
    required this.category,
    required this.categoryColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final percentage = (correctAnswers / totalQuestions * 100).round();
    final isPassed = percentage >= 60;

    return Scaffold(
      backgroundColor: categoryColor.withOpacity(0.1),
      appBar: AppBar(
        backgroundColor: categoryColor,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: const Text(
          'Hasil Kuis',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Result Icon
              Container(
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                  color: isPassed ? Colors.green : Colors.orange,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: (isPassed ? Colors.green : Colors.orange)
                          .withOpacity(0.3),
                      blurRadius: 20,
                      offset: const Offset(0, 10),
                    ),
                  ],
                ),
                child: Icon(
                  isPassed ? Icons.check : Icons.star,
                  size: 64,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 32),
              // Result Text
              Text(
                isPassed ? 'Selamat!' : 'Bagus!',
                style: const TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                isPassed
                    ? 'Kamu berhasil menyelesaikan kuis ini!'
                    : 'Terus belajar dan tingkatkan lagi!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey.shade700,
                ),
              ),
              const SizedBox(height: 40),
              // Score Card
              Container(
                padding: const EdgeInsets.all(32),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 20,
                      offset: const Offset(0, 10),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Text(
                      '$percentage%',
                      style: TextStyle(
                        fontSize: 64,
                        fontWeight: FontWeight.bold,
                        color: categoryColor,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Skor Kamu',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.grey.shade600,
                      ),
                    ),
                    const SizedBox(height: 24),
                    Divider(color: Colors.grey.shade300),
                    const SizedBox(height: 24),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        _buildStatItem(
                          'Benar',
                          correctAnswers.toString(),
                          Colors.green,
                          Icons.check_circle,
                        ),
                        Container(
                          width: 1,
                          height: 50,
                          color: Colors.grey.shade300,
                        ),
                        _buildStatItem(
                          'Salah',
                          (totalQuestions - correctAnswers).toString(),
                          Colors.red,
                          Icons.cancel,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 40),
              // Buttons
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const MainNavigationScreen(),
                      ),
                      (route) => false,
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: categoryColor,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    'Kembali ke Beranda',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 12),
              SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    side: BorderSide(color: categoryColor, width: 2),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    'Ulangi Kuis',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: categoryColor,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStatItem(String label, String value, Color color, IconData icon) {
    return Column(
      children: [
        Icon(icon, color: color, size: 32),
        const SizedBox(height: 8),
        Text(
          value,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: color,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}
