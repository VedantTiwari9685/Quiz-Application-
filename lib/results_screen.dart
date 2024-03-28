import 'package:adv_basics/data/questions.dart';
import 'package:flutter/material.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen(this.chosenAnswer, this.restartQuiz, {super.key});
  final List<String> chosenAnswer;
  final void Function() restartQuiz;

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];
    for (int i = 0; i < chosenAnswer.length; i++) {
      summary.add(
        {
          'question_index': i,
          'question': questions[i].question,
          'correct_answer': questions[i].answers[0],
          'user_answer': chosenAnswer[i]
        },
      );
    }

    return summary;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('You answered X answers out of Y'),
            const SizedBox(
              height: 30,
            ),
            const Text('List of answers....'),
            const SizedBox(
              height: 30,
            ),
            TextButton(
              onPressed: restartQuiz,
              child: const Text(
                'Restart Quiz',
                style: TextStyle(
                  color: Color.fromARGB(255, 216, 191, 116),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
