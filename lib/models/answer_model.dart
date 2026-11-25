enum AnswerValue { yes, no, unknown, notApplicable }

class AnswerOption {
  const AnswerOption({required this.value, required this.label});

  final AnswerValue value;
  final String label;
}
