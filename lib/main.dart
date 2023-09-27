import 'dart:math';
import 'package:flutter/material.dart';
import 'package:task_f2/ui/screens/question_detail.dart';
import 'data/model/question.dart';
import 'ui/widgets/question_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final questionList = Question.questionList;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Scaffold(
        appBar: AppBar(title: const Text("Questions App")),
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
        floatingActionButton: AddQuestionFAB(
          onPressed: () => _addQuestion(),
        ),
      ),
    );
  }

  void _addQuestion() {
    setState(() {
      int randomIndex = Random().nextInt(questionList.length);
      Question newQuestion = questionList[randomIndex];
      questionList.add(newQuestion);
    });
  }
}

class AddQuestionFAB extends StatelessWidget {
  final Function() onPressed;
  const AddQuestionFAB({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        onPressed();
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text("Question Added!")));
      },
      child: Image.asset(
        "assets/plus.png",
        height: 24,
        width: 24,
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
        const begin = Offset(1.0, 0.0);
        const end = Offset.zero;
        const curve = Curves.easeOut;

        final tween = Tween(begin: begin, end: end);
        final curvedAnimation = CurvedAnimation(parent: animation, curve: curve);

        return SlideTransition(
          position: tween.animate(curvedAnimation),
          child: child,
        );
      },
    );
  }
}
