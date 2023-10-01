import 'package:flutter/material.dart';
import 'package:task_f2/data/model/question.dart';

class AddQuestion extends StatefulWidget {
  final List<Question> questionList;

  const AddQuestion({
    super.key,
    required this.questionList,
  });

  @override
  State<AddQuestion> createState() => _AddQuestionState();
}

class _AddQuestionState extends State<AddQuestion> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController categoryController = TextEditingController();

  late final QuestionCategory _category;
  late final String _question;
  late final String _firstHint;
  late final String _secondHint;
  late final String _answer;

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      Question newQuestion = Question(
        category: _category,
        question: _question,
        hints: [_firstHint, _secondHint],
        answer: _answer,
      );

      widget.questionList.add(newQuestion);
    }
  }

  @override
  Widget build(BuildContext context) {
    const outlineInputBorder =
        OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(12)));
    final List<DropdownMenuEntry<QuestionCategory>> categoryEntries =
        <DropdownMenuEntry<QuestionCategory>>[];

    for (final QuestionCategory category in QuestionCategory.values) {
      categoryEntries.add(
        DropdownMenuEntry<QuestionCategory>(
          value: category,
          label: category.name,
          enabled: true,
        ),
      );
    }

    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Container(
            margin: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DropdownMenu<QuestionCategory>(
                  inputDecorationTheme: const InputDecorationTheme(
                    border: outlineInputBorder,
                  ),
                  initialSelection: QuestionCategory.general,
                  controller: categoryController,
                  label: const Text('Question category'),
                  dropdownMenuEntries: categoryEntries,
                  onSelected: (value) {
                    if (value != null) {
                      _category = value;
                    }
                  },
                ),
                const SizedBox(height: 16),
                TextField(
                  decoration: const InputDecoration(
                    border: outlineInputBorder,
                    labelText: 'Question',
                  ),
                  keyboardType: TextInputType.multiline,
                  onChanged: (value) {
                    _question = value;
                  },
                ),
                const SizedBox(height: 16),
                TextField(
                  decoration: const InputDecoration(
                    border: outlineInputBorder,
                    labelText: 'First hint',
                  ),
                  onChanged: ((value) {
                    _firstHint = value;
                  }),
                ),
                const SizedBox(height: 16),
                TextField(
                  decoration: const InputDecoration(
                    border: outlineInputBorder,
                    labelText: 'Second hint',
                  ),
                  onChanged: ((value) {
                    _secondHint = value;
                  }),
                ),
                const SizedBox(height: 16),
                TextField(
                  decoration: const InputDecoration(
                    border: outlineInputBorder,
                    labelText: 'Answer',
                  ),
                  onChanged: ((value) {
                    _answer = value;
                  }),
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(
                      onPressed: () => _submitForm,
                      child: const Text('Add Question'),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
