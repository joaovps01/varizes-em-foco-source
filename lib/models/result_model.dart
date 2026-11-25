class ResultContent {
  const ResultContent({
    required this.code,
    required this.title,
    required this.description,
    required this.orientation,
  });

  final String code;
  final String title;
  final String description;
  final String orientation;
}

class EvaluationResult {
  const EvaluationResult({
    required this.baseCode,
    required this.symptomSuffix,
    required this.content,
    required this.findings,
    required this.complementaryNotes,
    required this.requiresProfessionalAttention,
  });

  final String baseCode;
  final String symptomSuffix;
  final ResultContent content;
  final List<String> findings;
  final List<String> complementaryNotes;
  final bool requiresProfessionalAttention;

  String get fullCode => '$baseCode$symptomSuffix';

  String get symptomText {
    if (symptomSuffix == 'S') {
      return 'Sintomático: você informou dor, peso, cansaço, queimação, coceira, câimbras ou sensação de pressão nas pernas.';
    }
    return 'Assintomático: você não informou sintomas associados no questionário.';
  }
}
