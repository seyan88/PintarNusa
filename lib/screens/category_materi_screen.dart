import 'package:flutter/material.dart';
import 'video_materi_screen.dart';

class CategoryMateriListScreen extends StatelessWidget {
  final String category;
  final String categoryTitle;
  final Color categoryColor;

  const CategoryMateriListScreen({
    Key? key,
    required this.category,
    required this.categoryTitle,
    required this.categoryColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Dummy data materi
    final List<Map<String, dynamic>> materiList = [
      {'id': 1, 'title': 'Materi 1: Pengenalan Dasar', 'locked': false},
      {'id': 2, 'title': 'Materi 2: Tingkat Lanjut', 'locked': false},
      {'id': 3, 'title': 'Materi 3: Praktik', 'locked': true},
      {'id': 4, 'title': 'Materi 4: Evaluasi', 'locked': true},
    ];

    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: AppBar(
        backgroundColor: categoryColor,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          categoryTitle,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: categoryColor,
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(24),
                bottomRight: Radius.circular(24),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Daftar Materi',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Pilih materi untuk mulai belajar',
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.9),
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(20),
              itemCount: materiList.length,
              itemBuilder: (context, index) {
                final materi = materiList[index];
                final isLocked = materi['locked'] as bool;
                
                return Container(
                  margin: const EdgeInsets.only(bottom: 16),
                  child: InkWell(
                    onTap: isLocked
                        ? null
                        : () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => VideoMateriScreen(
                                  category: category,
                                  materiId: materi['id'],
                                  materiTitle: materi['title'],
                                  categoryColor: categoryColor,
                                ),
                              ),
                            );
                          },
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                          color: isLocked ? Colors.grey.shade300 : categoryColor,
                          width: 2,
                        ),
                        boxShadow: [
                          if (!isLocked)
                            BoxShadow(
                              color: categoryColor.withOpacity(0.1),
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
                              color: isLocked
                                  ? Colors.grey.shade200
                                  : categoryColor.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Icon(
                              isLocked ? Icons.lock : Icons.play_circle_filled,
                              color: isLocked ? Colors.grey : categoryColor,
                              size: 28,
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  materi['title'],
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: isLocked ? Colors.grey : Colors.black87,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  isLocked ? 'Terkunci' : 'Siap dipelajari',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: isLocked ? Colors.grey : categoryColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Icon(
                            Icons.arrow_forward_ios,
                            color: isLocked ? Colors.grey : categoryColor,
                            size: 16,
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
