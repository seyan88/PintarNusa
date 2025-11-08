import 'package:flutter/material.dart';
import 'quiz_result_screen.dart';

class QuizScreen extends StatefulWidget {
  final String category;
  final int materiId;
  final Color categoryColor;

  const QuizScreen({
    Key? key,
    required this.category,
    required this.materiId,
    required this.categoryColor,
  }) : super(key: key);

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int currentQuestionIndex = 0;
  int correctAnswers = 0;
  int? selectedAnswer;

  // Dummy questions
  final List<Map<String, dynamic>> questions = [
    {
      'question': 'Berapa hasil dari 5 + 3?',
      'options': ['6', '7', '8', '9'],
      'correctAnswer': 2, // index 2 = "8"
    },
    {
      'question': 'Berapa hasil dari 10 - 4?',
      'options': ['4', '5', '6', '7'],
      'correctAnswer': 2, // index 2 = "6"
    },
    {
      'question': 'Berapa hasil dari 3 × 4?',
      'options': ['10', '11', '12', '13'],
      'correctAnswer': 2, // index 2 = "12"
    },
  ];

  void _selectAnswer(int index) {
    setState(() {
      selectedAnswer = index;
    });
  }

  void _nextQuestion() {
    if (selectedAnswer == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Pilih jawaban terlebih dahulu!'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    // Check if answer is correct
    if (selectedAnswer == questions[currentQuestionIndex]['correctAnswer']) {
      correctAnswers++;
    }

    if (currentQuestionIndex < questions.length - 1) {
      setState(() {
        currentQuestionIndex++;
        selectedAnswer = null;
      });
    } else {
      // Quiz finished, navigate to result screen
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => QuizResultScreen(
            totalQuestions: questions.length,
            correctAnswers: correctAnswers,
            category: widget.category,
            categoryColor: widget.categoryColor,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[currentQuestionIndex];

    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: AppBar(
        backgroundColor: widget.categoryColor,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.close, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Soal ${currentQuestionIndex + 1}/${questions.length}',
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        children: [
          // Progress Bar
          LinearProgressIndicator(
            value: (currentQuestionIndex + 1) / questions.length,
            backgroundColor: Colors.grey.shade300,
            valueColor: AlwaysStoppedAnimation<Color>(widget.categoryColor),
            minHeight: 6,
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  // Question Card
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.05),
                          blurRadius: 10,
                          offset: const Offset(0, 5),
                        ),
                      ],
                    ),
                    child: Text(
                      currentQuestion['question'],
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                        height: 1.5,
                      ),
                    ),
                  ),
                  const SizedBox(height: 32),
                  // Answer Options
                  ...List.generate(
                    currentQuestion['options'].length,
                    (index) => Padding(
                      padding: const EdgeInsets.only(bottom: 16),
                      child: InkWell(
                        onTap: () => _selectAnswer(index),
                        child: Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: selectedAnswer == index
                                ? widget.categoryColor.withOpacity(0.1)
                                : Colors.white,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: selectedAnswer == index
                                  ? widget.categoryColor
                                  : Colors.grey.shade300,
                              width: 2,
                            ),
                          ),
                          child: Row(
                            children: [
                              Container(
                                width: 32,
                                height: 32,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: selectedAnswer == index
                                      ? widget.categoryColor
                                      : Colors.transparent,
                                  border: Border.all(
                                    color: selectedAnswer == index
                                        ? widget.categoryColor
                                        : Colors.grey.shade400,
                                    width: 2,
                                  ),
                                ),
                                child: Center(
                                  child: Text(
                                    String.fromCharCode(65 + index), // A, B, C, D
                                    style: TextStyle(
                                      color: selectedAnswer == index
                                          ? Colors.white
                                          : Colors.grey.shade600,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 16),
                              Expanded(
                                child: Text(
                                  currentQuestion['options'][index],
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: selectedAnswer == index
                                        ? FontWeight.bold
                                        : FontWeight.normal,
                                    color: Colors.black87,
                                  ),
                                ),
                              ),
                              if (selectedAnswer == index)
                                Icon(
                                  Icons.check_circle,
                                  color: widget.categoryColor,
                                ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, -5),
            ),
          ],
        ),
        child: ElevatedButton(
          onPressed: _nextQuestion,
          style: ElevatedButton.styleFrom(
            backgroundColor: widget.categoryColor,
            padding: const EdgeInsets.symmetric(vertical: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          child: Text(
            currentQuestionIndex < questions.length - 1
                ? 'Soal Berikutnya'
                : 'Selesai',
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
