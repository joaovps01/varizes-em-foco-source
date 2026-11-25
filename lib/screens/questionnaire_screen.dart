import 'package:material_ui/material_ui.dart';

import '../data/questions_data.dart';
import '../models/answer_model.dart';
import '../services/decision_tree_service.dart';
import '../theme/brand_theme.dart';
import '../widgets/primary_button.dart';
import '../widgets/progress_indicator_widget.dart';
import '../widgets/question_card.dart';
import '../widgets/theme_toggle_button.dart';
import 'home_screen.dart';
import 'result_screen.dart';

class QuestionnaireScreen extends StatefulWidget {
  const QuestionnaireScreen({super.key});

  @override
  State<QuestionnaireScreen> createState() => _QuestionnaireScreenState();
}

class _QuestionnaireScreenState extends State<QuestionnaireScreen> {
  final _answers = <String, AnswerValue>{};
  final _service = DecisionTreeService();
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    final question = questions[_index];
    final selected = _answers[question.id];
    final isLast = _index == questions.length - 1;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Triagem'),
        actions: [
          IconButton(
            tooltip: 'Voltar ao início',
            onPressed: _confirmExit,
            icon: const Icon(Icons.close),
          ),
          const ThemeToggleButton(),
          const SizedBox(width: 8),
        ],
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 720),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.all(18),
                    decoration: BoxDecoration(
                      color: BrandColors.card(context),
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: BrandColors.line(context)),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ProgressIndicatorWidget(
                          current: _index + 1,
                          total: questions.length,
                        ),
                        const SizedBox(height: 22),
                        AnimatedSwitcher(
                          duration: const Duration(milliseconds: 180),
                          child: QuestionCard(
                            key: ValueKey(question.id),
                            question: question,
                            selected: selected,
                            onChanged: (value) {
                              setState(() => _answers[question.id] = value);
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  _GuidanceBox(
                    text:
                        'Responda pensando no que você percebe nas pernas, tornozelos ou pés. Se não tiver certeza, use “Não sei”.',
                    icon: Icons.tips_and_updates_outlined,
                  ),
                  const SizedBox(height: 24),
                  Row(
                    children: [
                      if (_index > 0)
                        Expanded(
                          child: OutlinedButton.icon(
                            onPressed: _previous,
                            icon: const Icon(Icons.arrow_back),
                            label: const Text('Voltar'),
                          ),
                        ),
                      if (_index > 0) const SizedBox(width: 12),
                      Expanded(
                        child: PrimaryButton(
                          label: isLast ? 'Gerar resultado' : 'Continuar',
                          icon: isLast
                              ? Icons.assessment_outlined
                              : Icons.arrow_forward,
                          onPressed: selected == null ? null : _next,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _previous() {
    if (_index == 0) return;
    setState(() => _index--);
  }

  void _next() {
    if (_index < questions.length - 1) {
      setState(() => _index++);
      return;
    }

    final result = _service.evaluate(_answers);
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => ResultScreen(result: result)),
    );
  }

  Future<void> _confirmExit() async {
    final shouldExit = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Sair da triagem?'),
        content: const Text(
          'As respostas desta triagem serão descartadas se você voltar ao início.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Continuar triagem'),
          ),
          FilledButton(
            onPressed: () => Navigator.pop(context, true),
            child: const Text('Sair'),
          ),
        ],
      ),
    );

    if (shouldExit != true || !mounted) return;
    Navigator.pushNamedAndRemoveUntil(
      context,
      HomeScreen.routeName,
      (_) => false,
    );
  }
}

class _GuidanceBox extends StatelessWidget {
  const _GuidanceBox({required this.text, required this.icon});

  final String text;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: BrandColors.subtleCard(context),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: BrandColors.line(context)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: Theme.of(context).colorScheme.primary, size: 22),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                color: BrandColors.secondaryText(context),
                height: 1.35,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
