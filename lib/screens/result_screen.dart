import 'package:flutter/material.dart';

import '../models/result_model.dart';
import '../theme/brand_theme.dart';
import '../widgets/primary_button.dart';
import '../widgets/result_card.dart';
import '../widgets/theme_toggle_button.dart';
import 'home_screen.dart';
import 'questionnaire_screen.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({required this.result, super.key});

  final EvaluationResult result;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final accent = _resultAccent(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Resultado'),
        actions: const [ThemeToggleButton(), SizedBox(width: 8)],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 760),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(22),
                    decoration: BoxDecoration(
                      color: accent,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Sua classificação orientativa',
                          style: textTheme.labelLarge?.copyWith(
                            color: Colors.white.withValues(alpha: 0.80),
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              result.fullCode,
                              style: textTheme.displayLarge?.copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.w900,
                                height: 0.95,
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(bottom: 8),
                                child: Text(
                                  result.content.title,
                                  style: textTheme.titleMedium?.copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w800,
                                    height: 1.2,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 14),
                        Text(
                          'Use este resultado como ponto de partida para conversar com um profissional de saúde quando indicado.',
                          style: textTheme.bodyMedium?.copyWith(
                            color: Colors.white.withValues(alpha: 0.84),
                            height: 1.35,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  ResultCard(
                    title: result.requiresProfessionalAttention
                        ? 'Próximo passo recomendado'
                        : 'Como usar este resultado',
                    icon: result.requiresProfessionalAttention
                        ? Icons.local_hospital_outlined
                        : Icons.task_alt_outlined,
                    highlight: result.requiresProfessionalAttention,
                    children: [
                      Text(
                        result.content.orientation,
                        style: const TextStyle(height: 1.4),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  ResultCard(
                    title: 'Leitura do resultado',
                    icon: Icons.article_outlined,
                    children: [
                      Text(
                        result.content.description,
                        style: const TextStyle(height: 1.4),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  ResultCard(
                    title: 'Sintomas relatados',
                    icon: Icons.accessibility_new_outlined,
                    children: [
                      Text(
                        result.symptomText,
                        style: const TextStyle(height: 1.4),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  ResultCard(
                    title: 'Resumo das respostas',
                    icon: Icons.checklist_outlined,
                    children: [
                      ...result.findings.map((item) => _BulletText(text: item)),
                      ...result.complementaryNotes.map(
                        (item) => _BulletText(text: item),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  const _ConsultPrepCard(),
                  const SizedBox(height: 16),
                  ResultCard(
                    title: 'Importante',
                    icon: Icons.verified_user_outlined,
                    children: const [
                      Text(
                        'Esta classificação é baseada nas respostas fornecidas e deve ser entendida como orientação inicial. Ela não confirma diagnóstico e não substitui avaliação clínica profissional.',
                        style: TextStyle(height: 1.4),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  PrimaryButton(
                    label: 'Refazer triagem',
                    icon: Icons.refresh,
                    onPressed: () => Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const QuestionnaireScreen(),
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  OutlinedButton.icon(
                    onPressed: () => Navigator.pushNamedAndRemoveUntil(
                      context,
                      HomeScreen.routeName,
                      (_) => false,
                    ),
                    icon: const Icon(Icons.home_outlined),
                    label: const Text('Voltar ao início'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Color _resultAccent(BuildContext context) {
    if (result.baseCode == 'C0' || result.baseCode == 'C1') {
      return BrandColors.isDark(context)
          ? const Color(0xFF155E5B)
          : BrandColors.primary;
    }
    if (result.baseCode == 'C2' || result.baseCode == 'C3') {
      return BrandColors.isDark(context)
          ? const Color(0xFF72520F)
          : const Color(0xFFB7791F);
    }
    return BrandColors.isDark(context)
        ? const Color(0xFF7F1D1D)
        : const Color(0xFFB42318);
  }
}

class _ConsultPrepCard extends StatelessWidget {
  const _ConsultPrepCard();

  @override
  Widget build(BuildContext context) {
    return ResultCard(
      title: 'Para levar à consulta',
      icon: Icons.note_alt_outlined,
      children: const [
        _BulletText(text: 'Quando os sinais começaram ou pioraram.'),
        _BulletText(text: 'Se há dor, peso, coceira, câimbras ou inchaço.'),
        _BulletText(text: 'Se melhora ao elevar as pernas ou repousar.'),
      ],
    );
  }
}

class _BulletText extends StatelessWidget {
  const _BulletText({required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 7),
            child: Icon(
              Icons.circle,
              size: 7,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
          const SizedBox(width: 10),
          Expanded(child: Text(text, style: const TextStyle(height: 1.35))),
        ],
      ),
    );
  }
}
