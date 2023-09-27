import 'package:flutter/material.dart';
import '../../data/model/question.dart';

class QuestionWidget extends StatelessWidget {
  final Question question;
  final bool isPortrait;
  final Function onQuestionPressed;

  const QuestionWidget({
    Key? key,
    required this.question,
    required this.isPortrait,
    required this.onQuestionPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onQuestionPressed(question),
      child: Container(
        padding: const EdgeInsets.all(12),
        margin: const EdgeInsets.all(12),
        width: isPortrait ? null : 200,
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 219, 201, 236),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: 24,
                  height: 24,
                  margin: const EdgeInsets.only(bottom: 8),
                  child: question.category.getImage(Colors.deepPurple),
                ),
                const SizedBox(width: 12),
                Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 4,
                    horizontal: 8,
                  ),
                  margin: const EdgeInsets.only(bottom: 8),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 191, 181, 233),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    question.category.name.toUpperCase(),
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                ),
              ],
            ),
            Text(
              question.question,
              maxLines: 8,
              overflow: TextOverflow.ellipsis,
              softWrap: true,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ],
        ),
      ),
    );
  }
}
