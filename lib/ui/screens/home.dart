import 'package:flutter/material.dart';
import '../../data/model/question.dart';
import '../widgets/question_widget.dart';
import '../widgets/random_question_fab.dart';
import 'question_detail.dart';

class Home extends StatelessWidget {
  const Home({
    super.key,
    required this.questionList,
  });

  final List<Question> questionList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: const RandomQuestionFAB(),
      body: LayoutBuilder(
        builder: (context, constraints) {
          bool isPortrait =
              constraints.maxWidth < constraints.maxHeight ? true : false;
          return QuestionListView(
            questionList: questionList,
            isPortrait: isPortrait,
          );
        },
      ),
    );
  }
}

class QuestionListView extends StatelessWidget {
  final List<Question> questionList;
  final bool isPortrait;

  const QuestionListView({
    super.key,
    required this.questionList,
    required this.isPortrait,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: questionList.length,
      scrollDirection: isPortrait ? Axis.vertical : Axis.horizontal,
      itemBuilder: (context, index) => QuestionWidget(
        question: questionList[index],
        isPortrait: isPortrait,
        onQuestionPressed: (Question question) => {
          Navigator.push(
            context,
            _questionDetailRouter(question),
          )
        },
      ),
    );
  }

  Route _questionDetailRouter(Question question) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) =>
          QuestionDetail(question: question),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        final tween = Tween(begin: const Offset(1.0, 0.0), end: Offset.zero);
        final curvedAnimation = CurvedAnimation(
          parent: animation,
          curve: Curves.easeOut,
        );

        return SlideTransition(
          position: tween.animate(curvedAnimation),
          child: child,
        );
      },
    );
  }
}