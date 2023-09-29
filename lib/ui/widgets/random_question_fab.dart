import 'dart:math';
import 'package:flutter/material.dart';
import '../../data/model/question.dart';
import '../screens/question_detail.dart';

class RandomQuestionFAB extends StatefulWidget {
  const RandomQuestionFAB({super.key});

  @override
  State<RandomQuestionFAB> createState() => _RandomQuestionFABState();
}

class _RandomQuestionFABState extends State<RandomQuestionFAB> {
  final questionList = Question.questionList;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            _questionDetailRouter(
                questionList[Random().nextInt(questionList.length)]),
          );
        },
        child: const Icon(Icons.shuffle));
  }

  Route _questionDetailRouter(Question question) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) =>
          QuestionDetail(question: question),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(1.0, 0.0);
        const end = Offset.zero;
        const curve = Curves.easeOut;

        final tween = Tween(begin: begin, end: end);
        final curvedAnimation = CurvedAnimation(
          parent: animation,
          curve: curve,
        );

        return SlideTransition(
          position: tween.animate(curvedAnimation),
          child: child,
        );
      },
    );
  }
}
