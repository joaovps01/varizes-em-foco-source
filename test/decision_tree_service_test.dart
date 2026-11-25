import 'package:flutter_test/flutter_test.dart';
import 'package:triagem_varizes/models/answer_model.dart';
import 'package:triagem_varizes/services/decision_tree_service.dart';

void main() {
  final service = DecisionTreeService();

  Map<String, AnswerValue> baseAnswers({
    AnswerValue symptoms = AnswerValue.no,
  }) {
    return {
      'p01': AnswerValue.no,
      'p02': AnswerValue.no,
      'p03a': AnswerValue.no,
      'p03b': AnswerValue.no,
      'p03c': AnswerValue.no,
      'p04': AnswerValue.no,
      'p05': AnswerValue.no,
      'p06': AnswerValue.no,
      'p07': symptoms,
      'p08': AnswerValue.notApplicable,
      'p09': AnswerValue.notApplicable,
    };
  }

  test('returns C0A when there are no visible signs and no symptoms', () {
    final result = service.evaluate(baseAnswers());

    expect(result.fullCode, 'C0A');
  });

  test('returns C0S when there are no visible signs but symptoms exist', () {
    final result = service.evaluate(baseAnswers(symptoms: AnswerValue.yes));

    expect(result.fullCode, 'C0S');
  });

  test('prioritizes active wound over every other sign', () {
    final answers = baseAnswers(symptoms: AnswerValue.yes)
      ..['p01'] = AnswerValue.yes
      ..['p06'] = AnswerValue.yes
      ..['p05'] = AnswerValue.yes
      ..['p04'] = AnswerValue.yes
      ..['p03b'] = AnswerValue.yes;

    final result = service.evaluate(answers);

    expect(result.fullCode, 'C6S');
  });

  test('prioritizes healed wound over skin findings', () {
    final answers = baseAnswers()
      ..['p02'] = AnswerValue.yes
      ..['p03b'] = AnswerValue.yes;

    final result = service.evaluate(answers);

    expect(result.fullCode, 'C5A');
  });

  test('prioritizes C4b over other C4 subcategories', () {
    final answers = baseAnswers(symptoms: AnswerValue.yes)
      ..['p03a'] = AnswerValue.yes
      ..['p03b'] = AnswerValue.yes
      ..['p03c'] = AnswerValue.yes;

    final result = service.evaluate(answers);

    expect(result.fullCode, 'C4bS');
  });

  test('prioritizes C4c over edema and C4a when C4b is absent', () {
    final answers = baseAnswers()
      ..['p03a'] = AnswerValue.yes
      ..['p03c'] = AnswerValue.yes
      ..['p04'] = AnswerValue.yes;

    final result = service.evaluate(answers);

    expect(result.fullCode, 'C4cA');
  });

  test('prioritizes edema over varicose veins and spider veins', () {
    final answers = baseAnswers()
      ..['p04'] = AnswerValue.yes
      ..['p05'] = AnswerValue.yes
      ..['p06'] = AnswerValue.yes;

    final result = service.evaluate(answers);

    expect(result.fullCode, 'C3A');
  });

  test('prioritizes varicose veins over spider veins', () {
    final answers = baseAnswers(symptoms: AnswerValue.yes)
      ..['p05'] = AnswerValue.yes
      ..['p06'] = AnswerValue.yes;

    final result = service.evaluate(answers);

    expect(result.fullCode, 'C2S');
  });

  test('returns C1 when only spider veins are reported', () {
    final answers = baseAnswers()..['p06'] = AnswerValue.yes;

    final result = service.evaluate(answers);

    expect(result.fullCode, 'C1A');
  });
}
