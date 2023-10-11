import 'package:flutter/material.dart';
import 'data/model/question.dart';
import 'ui/screens/add_question.dart';
import 'ui/screens/home.dart';

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
  int currentPageIndex = 0;

  void _onSubmitAddQuestion(Question question) {
    setState(() {
      questionList.add(question);
    });
  }

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
        bottomNavigationBar: NavigationBar(
          onDestinationSelected: (int index) {
            setState(() {
              currentPageIndex = index;
            });
          },
          selectedIndex: currentPageIndex,
          destinations: const [
            NavigationDestination(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            NavigationDestination(
              icon: Icon(Icons.add),
              label: 'Add Question',
            ),
          ],
        ),
        body: <Widget>[
          Home(questionList: questionList),
          AddQuestion(onSubmit: (question) => _onSubmitAddQuestion(question)),
        ][currentPageIndex],
      ),
    );
  }
}