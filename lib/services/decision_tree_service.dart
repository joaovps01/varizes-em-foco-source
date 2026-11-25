import '../data/results_data.dart';
import '../models/answer_model.dart';
import '../models/result_model.dart';

class DecisionTreeService {
  EvaluationResult evaluate(Map<String, AnswerValue> answers) {
    final baseCode = _baseCode(answers);
    final suffix = answers['p07'] == AnswerValue.yes ? 'S' : 'A';
    final content = results[baseCode] ?? results['C0']!;

    return EvaluationResult(
      baseCode: baseCode,
      symptomSuffix: suffix,
      content: content,
      findings: _findings(answers),
      complementaryNotes: _complementaryNotes(answers),
      requiresProfessionalAttention: _requiresProfessionalAttention(
        baseCode,
        answers,
      ),
    );
  }

  String _baseCode(Map<String, AnswerValue> answers) {
    if (_yes(answers, 'p01')) return 'C6';
    if (_yes(answers, 'p02')) return 'C5';
    if (_yes(answers, 'p03b')) return 'C4b';
    if (_yes(answers, 'p03c')) return 'C4c';
    if (_yes(answers, 'p03a')) return 'C4a';
    if (_yes(answers, 'p04')) return 'C3';
    if (_yes(answers, 'p05')) return 'C2';
    if (_yes(answers, 'p06')) return 'C1';
    return 'C0';
  }

  List<String> _findings(Map<String, AnswerValue> answers) {
    final items = <String>[];
    void addIfYes(String id, String label) {
      if (_yes(answers, id)) items.add(label);
    }

    addIfYes('p01', 'Ferida aberta ainda não cicatrizada');
    addIfYes('p02', 'Histórico de ferida cicatrizada com marca ou cicatriz');
    addIfYes('p03a', 'Manchas, eczema, vermelhidão ou coceira persistente');
    addIfYes('p03b', 'Pele endurecida, retraída ou áreas esbranquiçadas');
    addIfYes('p03c', 'Vasinhos concentrados ao redor do tornozelo ou pé');
    addIfYes('p04', 'Inchaço frequente em pernas, tornozelos ou pés');
    addIfYes('p05', 'Veias dilatadas, tortuosas, saltadas ou palpáveis');
    addIfYes('p06', 'Vasinhos finos ou pequenas veias visíveis');

    if (items.isEmpty) {
      return ['Nenhum sinal visível ou palpável foi informado.'];
    }
    return items;
  }

  List<String> _complementaryNotes(Map<String, AnswerValue> answers) {
    final notes = <String>[];
    if (answers['p08'] == AnswerValue.yes) {
      notes.add(
        'Os sintomas pioram ao final do dia ou após muito tempo em pé.',
      );
    } else if (answers['p08'] == AnswerValue.no) {
      notes.add('Você informou que os sintomas não pioram nesse contexto.');
    }

    if (answers['p09'] == AnswerValue.yes) {
      notes.add('Os sintomas melhoram com repouso ou elevação das pernas.');
    } else if (answers['p09'] == AnswerValue.no) {
      notes.add(
        'Você informou que os sintomas não melhoram com repouso ou elevação das pernas.',
      );
    }

    return notes;
  }

  bool _requiresProfessionalAttention(
    String baseCode,
    Map<String, AnswerValue> answers,
  ) {
    return ['C3', 'C4', 'C4a', 'C4b', 'C4c', 'C5', 'C6'].contains(baseCode) ||
        _yes(answers, 'p01') ||
        _yes(answers, 'p02');
  }

  bool _yes(Map<String, AnswerValue> answers, String id) {
    return answers[id] == AnswerValue.yes;
  }
}
