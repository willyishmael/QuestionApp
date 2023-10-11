import 'package:flutter/material.dart';
import 'package:task_f2/data/model/question.dart';

class AddQuestion extends StatefulWidget {
  final Function(Question) onSubmit;

  const AddQuestion({
    super.key,
    required this.onSubmit,
  });

  @override
  State<AddQuestion> createState() => _AddQuestionState();
}

class _AddQuestionState extends State<AddQuestion> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController categoryController = TextEditingController();

  QuestionCategory _category = QuestionCategory.general;
  String _question = "";
  String _firstHint = "";
  String _secondHint = "";
  String _answer = "";

  void _submitForm(BuildContext context) {
    if (!_formKey.currentState!.validate()) {
      _showSnackBar(context, 'Form Error');
    } else if (_question.isEmpty ||
        _firstHint.isEmpty ||
        _secondHint.isEmpty ||
        _answer.isEmpty) {
      _showSnackBar(context, 'One or more required field is empty!');
    } else {
      Question newQuestion = Question(
        category: _category,
        question: _question,
        hints: [_firstHint, _secondHint],
        answer: _answer,
      );

      widget.onSubmit(newQuestion);

      _formKey.currentState!.reset();
      _category = QuestionCategory.general;

      _showSnackBar(context, 'A question added!');
    }
  }

  void _showSnackBar(BuildContext context, String message, [int seconds = 3]) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: Duration(seconds: seconds),
      ),
    );
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
                      onPressed: () => _submitForm(context),
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
