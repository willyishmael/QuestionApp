import 'package:flutter/material.dart';
import 'package:task_f2/data/model/question.dart';
import 'package:task_f2/ui/widgets/question_widget.dart';

class QuestionDetail extends StatefulWidget {
  final Question question;

  const QuestionDetail({
    super.key,
    required this.question,
  });

  @override
  State<QuestionDetail> createState() => _QuestionDetailState();
}

class _QuestionDetailState extends State<QuestionDetail> {
  var hintIndex = -1;
  var labelText = '';
  var bodyText = '';
  var buttonText = 'Show Hint';
  var showButton = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Question Detail'),
      ),
      body: Column(
        children: [
          QuestionWidget(
            question: widget.question,
            isPortrait: true,
            onQuestionPressed: () {},
          ),
          Container(
            padding: const EdgeInsets.all(12),
            margin: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 201, 210, 236),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (labelText.isNotEmpty)
                Text(
                  labelText,
                  style: Theme.of(context).textTheme.labelLarge,
                ),
                if (bodyText.isNotEmpty)
                Text(
                  bodyText,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                if (showButton)
                  Container(
                    alignment: Alignment.bottomRight,
                    child: TextButton(
                      onPressed: _nextButtonPressed,
                      child: Text(buttonText),
                    ),
                  )
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _nextButtonPressed() => setState(() {
        if (hintIndex < widget.question.hints.length) {
          hintIndex++;
          labelText = 'HINT';
          bodyText = widget.question.hints[hintIndex];
          buttonText = 'Next Hint';
        } else {
          labelText = 'ANSWER';
          bodyText = widget.question.answer;
          showButton = false;
        }
      });
}
