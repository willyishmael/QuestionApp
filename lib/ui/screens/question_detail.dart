import 'package:flutter/material.dart';
import 'package:task_f2/data/model/question.dart';

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Question Detail'),
      ),
      body: Center(child: Text(widget.question.question)) // how can i access question from here?
    );
  }
}
