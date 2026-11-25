import 'answer_model.dart';

class QuestionModel {
  const QuestionModel({
    required this.id,
    required this.shortTitle,
    required this.text,
    required this.options,
  });

  final String id;
  final String shortTitle;
  final String text;
  final List<AnswerOption> options;
}
