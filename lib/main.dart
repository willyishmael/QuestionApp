import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Question> questionList = [
    const Question(
      category: Category.general,
      question:
          "What is the true essence of existence? Is it to experience joy and learn from suffering?",
    ),
    const Question(
      category: Category.music,
      question:
          "If Bruno Mars were to have a signature dish, would it be a gourmet burger adorned with exotic toppings, or a platter of zesty tacos bursting with flavor?",
    ),
    const Question(
      category: Category.sports,
      question:
          "When comparing the skills and influence of Ronaldo and Messi on the field, is it possible to declare one superior, or do they each bring a unique magic to the game that defies comparison?",
    ),
    const Question(
      category: Category.general,
      question:
          "In the grand tapestry of human experience, how do we decipher the intricate threads that weave together to create our perception of happiness?",
    ),
    const Question(
      category: Category.music,
      question:
          "Among the discography of the legendary Michael Jackson, which album stands out as a timeless masterpiece that continues to captivate listeners across generations?",
    ),
    const Question(
      category: Category.sports,
      question:
          "Throughout the annals of basketball history, who stands atop the pinnacle with the record for the highest individual score achieved in a single game?",
    ),
    const Question(
      category: Category.general,
      question:
          "As humanity gazes into the abyss of time, contemplating the realm of possibility, is the concept of time travel merely a figment of imagination or a potential key to unlocking the secrets of the universe?",
    ),
    const Question(
      category: Category.music,
      question:
          "Immersed in the poetic verses of the song 'Imagine,' who crafted this profound musical reflection on a world without boundaries, divisions, and strife?",
    ),
    const Question(
      category: Category.sports,
      question:
          "Among the myriad global sporting spectacles that enrapture billions, which event stands as the ultimate pinnacle of competitive prowess and international unity?",
    ),
    const Question(
      category: Category.general,
      question:
          "As humanity's creative expression takes form on canvas, in sculpture, and through various mediums, what intrinsic yearning does art seek to fulfill in the human soul?",
    ),
  ];

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
                questionList: questionList, isPortrait: isPortrait);
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

  const QuestionListView(
      {super.key, required this.questionList, required this.isPortrait});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: questionList.length,
      scrollDirection: isPortrait ? Axis.vertical : Axis.horizontal,
      itemBuilder: (context, index) => QuestionWidget(
        question: questionList[index],
        isPortrait: isPortrait,
      ),
    );
  }
}

class QuestionWidget extends StatelessWidget {
  final Question question;
  final bool isPortrait;

  const QuestionWidget(
      {super.key, required this.question, required this.isPortrait});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.all(12),
      width: isPortrait ? null : 200,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 219, 201, 236),
        borderRadius: BorderRadius.circular(8),
      ),
      child: LayoutBuilder(builder: (context, constraints) {
        TextStyle? bodyTextStyle = Theme.of(context).textTheme.bodyLarge;
        TextStyle? labelTextStyle = Theme.of(context).textTheme.labelLarge;
        return Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(children: [
                Container(
                  width: 24,
                  height: 24,
                  margin: const EdgeInsets.only(bottom: 8),
                  child: question.category.getImage(Colors.deepPurple),
                ),
                const SizedBox(
                  width: 12,
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                  margin: const EdgeInsets.only(bottom: 8),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 191, 181, 233),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(question.category.name.toUpperCase(),
                      style: labelTextStyle),
                ),
              ]),
              Text(question.question,
                  maxLines: 8,
                  overflow: TextOverflow.ellipsis,
                  softWrap: true,
                  style: bodyTextStyle)
            ],
          ),
        );
      }),
    );
  }
}

enum Category {
  general('assets/border-all.png'),
  sports('assets/basketball.png'),
  music('assets/music-alt.png');

  const Category(this.imagePath);
  final String imagePath;

  Image getImage(Color color) => Image.asset(
        imagePath,
        color: color,
      );
}

class Question {
  final Category category;
  final String question;

  const Question({required this.category, required this.question});
}
