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

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: LayoutBuilder(builder: (context, constraints) {
        bool isPortrait =
            constraints.maxWidth < constraints.maxHeight ? true : false;
        return Scaffold(
          appBar: AppBar(title: const Text("Questions App")),
          bottomNavigationBar:
              isPortrait ? _getBottomNavigationBar() : const SizedBox(),
          body: Row(
            children: [
              isPortrait ? const SizedBox() : _getNavigationRail(),
              Expanded(
                child: routes[currentPageIndex],
              ),
            ],
          ),
        );
      }),
    );
  }

  void _onSubmitAddQuestion(Question question) {
    setState(() {
      questionList.add(question);
    });
  }

  List<Widget> get routes {
    return <Widget>[
      Home(questionList: questionList),
      AddQuestion(onSubmit: (question) => _onSubmitAddQuestion(question)),
    ];
  }

  NavigationBar _getBottomNavigationBar() {
    return NavigationBar(
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
    );
  }

  NavigationRail _getNavigationRail() {
    return NavigationRail(
      onDestinationSelected: (int index) {
        setState(() {
          currentPageIndex = index;
        });
      },
      groupAlignment: 0,
      selectedIndex: currentPageIndex,
      destinations: const [
        NavigationRailDestination(
          icon: Icon(Icons.home),
          label: Text('Home'),
        ),
        NavigationRailDestination(
          icon: Icon(Icons.add),
          label: Text('Add Question'),
        ),
      ],
    );
  }
}
