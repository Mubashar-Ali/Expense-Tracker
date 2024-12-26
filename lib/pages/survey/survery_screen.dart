// Survey Screen Template in Flutter
import 'package:expanse_tracker/core/components/navigation_menu.dart';
import 'package:flutter/material.dart';

class SurveyScreen extends StatelessWidget {
  final String question;
  final List<String> options;
  final ValueChanged<int?> onOptionSelected;
  final VoidCallback onContinue;
  final int? selectedOption;

  const SurveyScreen({
    required this.question,
    required this.options,
    required this.onOptionSelected,
    required this.onContinue,
    this.selectedOption,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
            onPressed: () {},
            child: const Text(
              'Skip',
            ),
          )
        ],
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              question,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: options.length,
                itemBuilder: (context, index) {
                  return RadioListTile<int>(
                    value: index,
                    groupValue: selectedOption,
                    onChanged: onOptionSelected,
                    title: Text(options[index]),
                    activeColor: Color(0xFF1058ed),
                  );
                },
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: onContinue,
                style: ElevatedButton.styleFrom(),
                child: const Text('Continue'),
              ),
            )
          ],
        ),
      ),
    );
  }
}

// Example Usage
class SurveyFlow extends StatefulWidget {
  static const routeName = "Survey_Screen";

  const SurveyFlow({super.key});
  @override
  State<SurveyFlow> createState() => _SurveyFlowState();
}

class _SurveyFlowState extends State<SurveyFlow> {
  final List<Map<String, dynamic>> surveyQuestions = [
    {
      'question': 'What is your main source of income?',
      'options': ['Salary', 'Freelancing', 'Business', 'Investments', 'Other']
    },
    {
      'question':
          'What is your main goal for using an expense tracker application?',
      'options': [
        'To better understand my spending habits',
        'To create and stick to a budget',
        'To track my progress towards financial goals',
        'To save money',
        'Other'
      ]
    },
    {
      'question':
          'How satisfied are you with your current financial situation?',
      'options': [
        'Very satisfied',
        'Somewhat satisfied',
        'Neither satisfied nor dissatisfied',
        'Somewhat dissatisfied',
        'Very dissatisfied'
      ]
    },
  ];

  int currentQuestionIndex = 0;
  int? selectedOption;

  void nextQuestion() {
    if (currentQuestionIndex < surveyQuestions.length - 1) {
      setState(() {
        currentQuestionIndex++;
        selectedOption = null;
      });
    } else {
      // Complete survey
      Navigator.pushNamed(context, NavigationMenu.routeName);
      // ScaffoldMessenger.of(context).showSnackBar(
      //   const SnackBar(content: Text('Survey Completed!')),
      // );
    }
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = surveyQuestions[currentQuestionIndex];

    return SurveyScreen(
      question: currentQuestion['question'],
      options: List<String>.from(currentQuestion['options']),
      selectedOption: selectedOption,
      onOptionSelected: (value) {
        setState(() {
          selectedOption = value;
        });
      },
      onContinue: nextQuestion,
    );
  }
}
