import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../widgets/primary_button.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int _currentQuestionIndex = 0;
  String? _selectedAnswer;
  bool _isAnswerChecked = false;

  final List<Map<String, dynamic>> _mockQuestions = [
    {
      'question': 'What is Encapsulation in Java?',
      'options': [
        'Hiding internal state and requiring all interaction to be performed through an object\'s methods.',
        'A feature that allows a class to inherit from multiple classes.',
        'The ability of different classes to respond to the same method call.',
        'A way to define abstract classes without implementation.'
      ],
      'correctAnswer': 'Hiding internal state and requiring all interaction to be performed through an object\'s methods.',
    },
    {
      'question': 'Which normal form deals with removing partial dependencies?',
      'options': [
        'First Normal Form (1NF)',
        'Second Normal Form (2NF)',
        'Third Normal Form (3NF)',
        'Boyce-Codd Normal Form (BCNF)'
      ],
      'correctAnswer': 'Second Normal Form (2NF)',
    }
  ];

  void _checkAnswer() {
    if (_selectedAnswer != null) {
      setState(() {
        _isAnswerChecked = true;
      });
    }
  }

  void _nextQuestion() {
    if (_currentQuestionIndex < _mockQuestions.length - 1) {
      setState(() {
        _currentQuestionIndex++;
        _selectedAnswer = null;
        _isAnswerChecked = false;
      });
    } else {
      // Quiz finished
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => AlertDialog(
          title: const Text('Quiz Completed!'),
          content: const Text('You have successfully completed this AI-generated quiz.'),
          actions: [
            TextButton(
              onPressed: () {
                context.pop(); // Close dialog
                context.pop(); // Go back to previous screen
              },
              child: const Text('Done'),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final currentQ = _mockQuestions[_currentQuestionIndex];
    final options = currentQ['options'] as List<String>;

    return Scaffold(
      appBar: AppBar(
        title: const Text('AI Quiz Practice'),
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () => context.pop(),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Question ${_currentQuestionIndex + 1} of ${_mockQuestions.length}',
                style: theme.textTheme.titleMedium?.copyWith(
                  color: theme.colorScheme.primary,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                currentQ['question'],
                style: theme.textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 32),
              Expanded(
                child: ListView.builder(
                  itemCount: options.length,
                  itemBuilder: (context, index) {
                    final option = options[index];
                    final isSelected = _selectedAnswer == option;
                    final isCorrect = option == currentQ['correctAnswer'];

                    Color? getBorderColor() {
                      if (!_isAnswerChecked) return isSelected ? theme.colorScheme.primary : theme.colorScheme.outline;
                      if (isCorrect) return Colors.green;
                      if (isSelected && !isCorrect) return Colors.red;
                      return theme.colorScheme.outline.withOpacity(0.5);
                    }

                    Color? getBackgroundColor() {
                      if (!_isAnswerChecked) return isSelected ? theme.colorScheme.primaryContainer : null;
                      if (isCorrect) return Colors.green.withOpacity(0.2);
                      if (isSelected && !isCorrect) return Colors.red.withOpacity(0.2);
                      return null;
                    }

                    return Padding(
                      padding: const EdgeInsets.only(bottom: 12.0),
                      child: InkWell(
                        onTap: _isAnswerChecked
                            ? null
                            : () {
                                setState(() {
                                  _selectedAnswer = option;
                                });
                              },
                        borderRadius: BorderRadius.circular(12),
                        child: Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            border: Border.all(color: getBorderColor()!, width: 2),
                            borderRadius: BorderRadius.circular(12),
                            color: getBackgroundColor(),
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: Text(
                                  option,
                                  style: theme.textTheme.bodyLarge?.copyWith(
                                    fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                                  ),
                                ),
                              ),
                              if (_isAnswerChecked && isCorrect)
                                const Icon(Icons.check_circle, color: Colors.green),
                              if (_isAnswerChecked && isSelected && !isCorrect)
                                const Icon(Icons.cancel, color: Colors.red),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 16),
              PrimaryButton(
                text: _isAnswerChecked 
                    ? (_currentQuestionIndex < _mockQuestions.length - 1 ? 'Next Question' : 'Finish Quiz')
                    : 'Check Answer',
                onPressed: _selectedAnswer == null 
                    ? () {} // Disabled
                    : (_isAnswerChecked ? _nextQuestion : _checkAnswer),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
